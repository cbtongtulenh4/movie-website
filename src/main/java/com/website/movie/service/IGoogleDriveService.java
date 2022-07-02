package com.website.movie.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

public interface IGoogleDriveService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 10/06/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    String uploadFile(MultipartFile fileUpload);

    void deleteFile(final String fileId);



}
