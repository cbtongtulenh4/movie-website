package com.website.movie.persistence.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "comment")
@Data
public class CommentEntity extends BaseEntity{
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 31/01/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    @Column(name = "cm_name_user")
    private String name;
    @Column(name = "cm_path_image")
    private String pathImg;
    @Column(
            name = "cm_content",
            columnDefinition = "TEXT"
    )
    private String content;
    @Column(
            name = "cm_ep",
            columnDefinition = "0"
    )
    private int ep;
    @Column(name = "cm_like")
    private Integer numLike = 0;

    private Integer spam = 0;
//    @Column(name = "cm_reply")
//    private Integer numReply;

    @Column(name = "cm_created_on")
    @CreationTimestamp
    private LocalDateTime createdOn;

//    @Column(name = "cm_parent_id")
//    private Long parentId = 0L;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(
            name = "cm_parent_id",
            columnDefinition = "0"
    )
//    @ColumnDefault(value = "0")
    private Set<CommentEntity> comments = new HashSet<>();

//    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    @JoinColumn(name = "cm_user_id")
//    private UserEntity user = new UserEntity();



}
