package com.anna.sixcities.controller;

import com.anna.sixcities.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class ImageController {

    @Autowired
    private ImageService imageService;

    @GetMapping("/image/{imageName}")
    public ResponseEntity<Resource> getImage(@PathVariable String imageName) {
        Resource image = imageService.getImage(imageName);

        return ResponseEntity.ok()
                .contentType(MediaType.IMAGE_JPEG)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + imageName + "\"")
                .body(image);
    }

    @GetMapping("/avatar/{avatarName}")
    public ResponseEntity<Resource> getAvatar(@PathVariable String avatarName) {
        Resource image = imageService.getAvatar(avatarName);

        return ResponseEntity.ok()
                .contentType(MediaType.valueOf("image/svg+xml"))
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + avatarName + "\"")
                .body(image);
    }
}
