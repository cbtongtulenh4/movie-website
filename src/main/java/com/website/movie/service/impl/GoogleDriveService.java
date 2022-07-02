package com.website.movie.service.impl;

import com.google.api.client.http.InputStreamContent;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.website.movie.service.IGoogleDriveService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Collections;

@PropertySource({
    "classpath:application.properties"
})
@Service
public class GoogleDriveService implements IGoogleDriveService {
    /**
     * @Project: MovieWebsite
     * @Author: Fu.Minh_Phuc on 10/06/2022
     * @Github: https://github.com/cbtongtulenh4
     * @ModifiedBy:
     */

    /*
        More : https://github.com/sandeep0402/technicalsand.com-examples/blob/master/google-drive-examples
     */

    @Autowired
    private Drive googleDriveManager;

    @Value("${google.drive.api.folder_id}")
    private String folderID;


    private static final Logger LOGGER = LoggerFactory.getLogger(GoogleDriveService.class);

    @Override
    public String uploadFile(MultipartFile file) {
        try {
            File newGGDriveFile = new File();
            newGGDriveFile.setParents(Collections.singletonList(folderID))
                    .setName(file.getOriginalFilename());
            InputStreamContent fileContent = new InputStreamContent(
                    file.getContentType(),
                    new ByteArrayInputStream(file.getBytes())
            );
            File uploadFile = googleDriveManager.files().create(newGGDriveFile, fileContent)
                    .setFields("id").execute();
            return uploadFile.getId();
        } catch (IOException e) {
            LOGGER.error(e.getMessage());
        }
        return null;
    }

    @Override
    public void deleteFile(String fileId) {
        try {
            googleDriveManager.files().delete(fileId).execute();
        } catch (IOException e) {
            LOGGER.error(e.getMessage());
        }
    }

}
