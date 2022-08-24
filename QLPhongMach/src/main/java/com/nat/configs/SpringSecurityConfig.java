/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nat.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nat.handlers.LoginHandler;
import com.nat.handlers.LogoutHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author anhtuan
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.nat.repository",
    "com.nat.service",
    "com.nat.handlers",})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private LoginHandler loginHandler;
    
    @Autowired
    private LogoutHandler logoutHanlder;
    
    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");
        http.formLogin().successHandler(loginHandler);
   
        http.logout().logoutSuccessHandler(logoutHanlder);

        http.exceptionHandling().accessDeniedPage("/login?accessDenied");

        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/admin/**" )
                .access("hasRole('ROLE_ADMIN')");
        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/bacsi/**" )
                .access("hasRole('ROLE_BACSI')");
        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/yta/**" )
                .access("hasRole('ROLE_YTA')");

        http.csrf().disable();
    }
    
    @Bean
    public Cloudinary cloudinary() {
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dhldfozup",
                "api_key", "999276666868985",
                "api_secret", "-tYCFj4eJA0RLBm3zuk1kFwkeG8",
                "secure", true));
        return cloudinary;
    }
}
