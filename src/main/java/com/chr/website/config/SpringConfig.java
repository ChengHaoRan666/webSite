package com.chr.website.config;

import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * @Author: 程浩然
 * @Create: 2024/9/8 - 9:11
 * @Description: SpringConfig.java 代替 Spring.xml
 */
// 表明配置类
@Configuration
// 开启扫描，排除 ControllerAdvice 和 Controller 注解的组件
@ComponentScan(basePackages = "com.chr.website", excludeFilters = {@ComponentScan.Filter(type = FilterType.ANNOTATION, classes = {org.springframework.stereotype.Controller.class, org.springframework.web.bind.annotation.ControllerAdvice.class})})
// 告诉资源路径
@PropertySources({@PropertySource("classpath:jdbc.properties")})
// 启用基于注解的事务管理
@EnableTransactionManagement
public class SpringConfig {
    /**
     * 配置数据源
     */
    @Bean
    public DataSource dataSource(@Value("${jdbc.driver}") String driver, @Value("${jdbc.url}") String url, @Value("${jdbc.username}") String username, @Value("${jdbc.password}") String password) {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(driver);
        dataSource.setUrl(url);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        return dataSource;
    }

    /**
     * 配置 SqlSessionFactory bean<br>
     * 在Mybatis-Config配置文件中的设置都可以在这里设置
     */
    @Bean
    public SqlSessionFactory sqlSessionFactory(@Autowired DataSource dataSource) throws Exception {
        // 创建仓库bean
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        // 设置数据源
        sqlSessionFactoryBean.setDataSource(dataSource);
        // 设置 Mybatis 配置文件（如果配置文件中没有东西可以不设置）
        sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
        // 设置类型别名对应的包
        sqlSessionFactoryBean.setTypeAliasesPackage("com.chr.website.entity");
        // 设置设置映射文件的路径，若映射文件所在路径和mapper接口所在路径一致，则不需要设置
        sqlSessionFactoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("mappers/*Mapper.xml"));
        // 设置下划线映射为驼峰
        Properties properties = new Properties();
        properties.put("mapUnderscoreToCamelCase", true);
        sqlSessionFactoryBean.setConfigurationProperties(properties);
        // 设置分页插件
        sqlSessionFactoryBean.setPlugins(new PageInterceptor());

        return sqlSessionFactoryBean.getObject();
    }


    /**
     * 配置mapper接口的扫描配置<br>
     * 由mybatis-spring提供，可以将指定包下所有的mapper接口创建动态代理<br>
     * 并将这些动态代理作为IOC容器的bean管理
     */
    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer scanner = new MapperScannerConfigurer();
        scanner.setBasePackage("com.chr.website.mapper");
        scanner.setSqlSessionFactoryBeanName("sqlSessionFactory");
        return scanner;
    }
}