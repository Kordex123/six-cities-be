package com.anna.sixcities.util;

import com.anna.sixcities.model.PermissionType;
import com.anna.sixcities.security.CustomUserPrincipal;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;
import java.util.stream.Stream;

public class SecurityUtil {
    public static String getLogin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return username;
    }

    public static Long getCurrentUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (isAuthenticated(authentication)) {
            CustomUserPrincipal principal = (CustomUserPrincipal) authentication.getPrincipal();
            return principal.getUserId();
        }
        return null;
    }

    private static boolean isAuthenticated(Authentication authentication) {
        if (authentication == null) {
            return false;
        }
        List<String> authorities = authentication.getAuthorities().stream().map(authority -> authority.getAuthority().replace("ROLE_", "")).toList();
        List<String> permissionTypes = Stream.of(PermissionType.values()).map(PermissionType::name).toList();
        return authorities.stream().anyMatch(permissionTypes::contains);
    }
}
