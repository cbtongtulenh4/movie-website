package com.website.movie.persistence.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "video")
@Data
public class VideoEntity {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 01/07/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String code;
    private String image;
    private String path;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @ToString.Exclude @EqualsAndHashCode.Exclude
//    @JsonBackReference(value = "video-tv-season")
//    private TVSeasonEntity tvSeason;

    public VideoEntity(){
        this.image = "";
    }

    public VideoEntity(String path) {
        this.image = "";
        this.path = path;
    }

    public VideoEntity(Long id, String code, String path) {
        this.id = id;
        this.image = "";
        this.code = code;
        this.path = path;
    }

    public VideoEntity(Long id, String code, String image, String path) {
        this.id = id;
        this.code = code;
        this.image = image;
        this.path = path;
    }
}
