package com.website.movie.service.impl;

import com.website.movie.persistence.entity.MovieEntity;
import com.website.movie.service.IScrapingService;
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


}
