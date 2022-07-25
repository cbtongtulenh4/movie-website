package com.website.movie.service.impl;

import com.website.movie.persistence.entity.*;
import com.website.movie.service.IScrapingService;
import com.website.movie.utils.StringUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class ScrapingService implements IScrapingService {

    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 05/03/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    private final static Logger LOGGER = LoggerFactory.getLogger(ScrapingService.class);

    private static HashSet<String> links = new HashSet<>();
    private Document loadJsoupDocumentCustomized(final String URL) throws IOException {
        // check if URL already crawled
//        if (links.contains(URL)){
//            LOGGER.warn("This URL :'" + URL + "' is crawled");
//            return null;
//        }
        links.add(URL);
        return Jsoup.connect(URL)
                .userAgent("Mozilla")
                .cookie("auth", "token")
                .timeout(3000)
                .post();
    }


    @Override
    public List<MovieEntity> getJsoupAllMovie(final String URL, final String container) {
        List<MovieEntity> movieEntities = null;
        try {
            Document document = loadJsoupDocumentCustomized(URL);
            assert document != null;
            Elements items = document.select(container);
             if (!items.isEmpty()){
                movieEntities = new ArrayList<>();
                for (Element item : items) {
                    MovieEntity movie = new MovieEntity();
                    movie.setTitle(item.select(".Title").first().text());
                    movie.setThumbnail(item.select("img[src]").first().attr("src"));
                    movie.setRate(Float.valueOf(item.select("span.Vote.AAIco-star").first().text()));

                    String tvSeasonURL = item.select("article a").first().attr("href");
                    movie.setTvSeasons(getJsoupAllTVSeason(tvSeasonURL));

                    movieEntities.add(movie);
                }
                return movieEntities;
            }

        } catch (IOException e) {
            LOGGER.error("For '" + URL + "': " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<String> getJsoupGenres(String URL, String container) {
        List<String> genres;
        try {
            Document document = loadJsoupDocumentCustomized(URL);
            Elements items = document.select(container);
            if (!items.isEmpty()){
                genres = new ArrayList<>();
                for (Element item : items){
                    genres.add(item.text());
                }
                return genres;
            }
        } catch (IOException e) {
            LOGGER.error("For '" + URL + "': " + e.getMessage());
        }
        return null;
    }

    private Set<TVSeasonEntity> getJsoupAllTVSeason(String URL){
        Set<TVSeasonEntity> tvSeasons = new HashSet<>();
        try {
            Document document = loadJsoupDocumentCustomized(URL);
            Elements links = document.select("main .TPost.Single .MovieInfo .season_item a");
            if (!links.isEmpty()){
                for (Element link : links){
                    TVSeasonEntity tvSeason = getJsoupTVSeasonEntity(link.attr("href"));
                    if (tvSeason != null){
                        tvSeasons.add(tvSeason);
                    }
                }
                return tvSeasons;
            }
            TVSeasonEntity tvSeason = getJsoupTVSeasonEntity(URL);
            if (tvSeason != null){
                tvSeasons.add(tvSeason);
            }
            tvSeasons.add(tvSeason);

        } catch (IOException e) {
            LOGGER.error("For '" + URL + "': " + e.getMessage());
        }
        return tvSeasons;
    }


    private TVSeasonEntity getJsoupTVSeasonEntity(final String URL){
        TVSeasonEntity tvSeasonEntity;
        try {
            Document document = loadJsoupDocumentCustomized(URL);
            assert document != null;
            Element container = document.select("main").first();
            tvSeasonEntity = new TVSeasonEntity();
            tvSeasonEntity.setCode(StringUtil.getValueByURL(URL, -1));

            Element contain1 = container.select(".TPost.Single").first();
            tvSeasonEntity.setTitle(contain1.select("header h1.Title").text());
            tvSeasonEntity.setSummary(contain1.select("header div.Description").first().ownText());
            tvSeasonEntity.setThumbnail(contain1.select("header .Image figure img").first().attr("src"));
            String view = contain1.select("footer p.Info .View").first().ownText().replace(",", "");
            tvSeasonEntity.setViews(Long.valueOf(StringUtil.getSplitValue(view, " ", 0)));

            contain1 = container.select(".MovieInfo.TPost.Single").first();
            Element contain2 = contain1.select("#MvTb-Info .mvici-left").first();
            Element tag;
            Elements items = contain2.select("li");
            int diff = (items.size() > 6) ? 2 : (items.size() > 5) ? 1 : 0;
//            switch (items.size()){
//                case 5:
//                    diff = 0;
//                    break;
//
//            }

            tvSeasonEntity.setStatus(
                    (diff > 0) ? items.get(diff).ownText().trim() : ""
            );
            tvSeasonEntity.setFollowers(Integer.valueOf(items.get(4+diff).ownText().trim().replace(",","")));
            Set<MovieGenresEntity> genres = new HashSet<>();
            for (Element item : items.get(1+diff).select("a")){
                MovieGenresEntity movieGenre = new MovieGenresEntity();
                movieGenre.setCode(StringUtil.getValueByURL(item.attr("href"), -1));
                movieGenre.setName(item.text());
                genres.add(movieGenre);
            }
            tvSeasonEntity.setGenres(genres);
            tag = items.get(3).select("a").first();
            if (!tag.ownText().isEmpty()){
                tvSeasonEntity.setCountry(new CountryEntity(
                        StringUtil.getValueByURL(tag.attr("href"), -1),
                        tag.ownText()
                ));
            }

            contain2 = contain1.select("#MvTb-Info .mvici-right").first();
            items = contain2.select("li");
            diff = items.size();
            diff = (diff > 5) ? 0 : 1;
//            String[] rating = items.get(2).select("span").first().ownText().split(" - ");
//            tvSeasonEntity.setRatings(
//                    new HashSet<RatingEntity>() {{ add(new RatingEntity(StringUtil.convertToCode(rating[0]), rating[1])); }}
//            );
            String language = items.get(3).ownText().trim();
            tvSeasonEntity.setLanguages(
                    new HashSet<LanguageEntity>(){{add(new LanguageEntity(StringUtil.convertToCode(language), language));}}
            );

            if(diff == 0){
                String studio = items.get(4).ownText().trim();
                tvSeasonEntity.setStudios(
                        new HashSet<StudioEntity>(){{add(new StudioEntity(StringUtil.convertToCode(studio), studio));}}
                );
            }
            tag = items.get(5-diff).select("a").first();
            String seasonText = tag.ownText();
            String[] seasonUrl = tag.attr("href").split("/");
            int seasonSize = seasonUrl.length;
            tvSeasonEntity.setSeason(new SeasonEntity(
                    seasonUrl[seasonSize - 2] + "-" + seasonUrl[seasonSize - 1],
                    seasonText.split(" - ")[0],
                    Integer.valueOf(seasonUrl[seasonSize-1])
            ));

            return tvSeasonEntity;
        } catch (IOException e) {
            LOGGER.error("For '" + URL + "': " + e.getMessage());
        }
        return null;
    }

//    private List<String> getAttributeByTagA(Element el){
//        List<String> rs = new ArrayList<>();
//        for (Element item : el.select("a")){
//
//        }
//    }

    private boolean checkExistTVSeasonEntityByURL(String URL){
        List<TVSeasonEntity> tvSeasons = UtilService.getSeasonMovieCache();
        String codeURL = StringUtil.getValueByURL(URL, -1);
        return tvSeasons.stream().anyMatch(e -> e.getCode().equals(codeURL));
    }

    public static void main(String[] args) {
        ScrapingService scraping = new ScrapingService();
        List<MovieEntity> movieEntities = scraping.getJsoupAllMovie("http://animevietsub.tv/", "#hot-home ul li.TPostMv");
//        Set<TVSeasonEntity> tvSeasonEntities = scraping.getJsoupAllTVSeason("http://animevietsub.tv/phim/mushoku-tensei-isekai-Ittara-honki-dasu-2nd-season-a4627/");
        System.out.println(movieEntities);
    }


}
