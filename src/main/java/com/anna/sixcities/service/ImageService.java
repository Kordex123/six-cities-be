package com.anna.sixcities.service;

import com.anna.sixcities.util.ObjectUtil;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

@Service
public class ImageService {

    public Resource getImage(String imageName) {
        return new ClassPathResource("/images/" + ObjectUtil.getImageNumber(imageName) + ".jpg");
    }

    public Resource getAvatar(String avatarName) {
        Resource avatar = new ClassPathResource("/avatar/" + avatarName);
        if (avatar.exists()) {
            return avatar;
        }
        return new ClassPathResource("/avatar/avatar.svg");
    }
}
