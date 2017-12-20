package org.itstep.security;

import org.itstep.security.domain.entities.AutoUser;
import org.itstep.security.domain.repositories.AutoUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    AutoUserRepository autoUserRepository;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        AutoUser user = autoUserRepository.findUserByUsername(s);

        return new User(user.getUsername(), "{noop}"+user.getPassword(), AuthorityUtils.createAuthorityList(user.getRole()));
    }
}
