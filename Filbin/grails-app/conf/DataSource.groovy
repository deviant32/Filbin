dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
		//grails.logging.jul.usebridge = false
		//grails.serverURL = "http://5i63ygtqjh.elasticbeanstalk.com"
		dataSource {
			pooled = true
			driverClassName = "com.mysql.jdbc.Driver"
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			String host = System.getenv('OPENSHIFT_MYSQL_DB_HOST')
		    String port = System.getenv('OPENSHIFT_MYSQL_DB_PORT')
		    String dbName = System.getenv('OPENSHIFT_APP_NAME')
		    url = "jdbc:mysql://$host:$port/$dbName"
		    username = System.getenv('OPENSHIFT_MYSQL_DB_USERNAME')
		    password = System.getenv('OPENSHIFT_MYSQL_DB_PASSWORD')
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
			properties {
				validationQuery = "SELECT 1"
				testOnBorrow = true
				testOnReturn = true
				testWhileIdle = true
				timeBetweenEvictionRunsMillis = 1000 * 60 * 30
				numTestsPerEvictionRun = 3
				minEvictableIdleTimeMillis = 1000 * 60 * 30
			}
		}
    }
}
