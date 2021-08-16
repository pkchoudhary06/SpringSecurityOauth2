

CREATE TABLE `oauth_client_details` (
  `id` varchar(255) NOT NULL,
  `access_token_validity` int DEFAULT NULL,
  `additional_information` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `authorized_grant_types` varchar(255) DEFAULT NULL,
  `autoapprove` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `refresh_token_validity` int DEFAULT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `oauth_client_details` VALUES ('1',36000,NULL,'ROLE_CLIENT','password,authorization_code,refresh_token,client_credentials','true','client','{bcrypt}$2y$12$WBcP53NiC20Gyksn2nN5SOttJWN.kdHQz71Vt7pkSQXVbcqx/trVK',36000,'user-resource,utility-resource','foo,read,write','http://localhost:8082/login,http://localhost:8083/login,http://localhost:8084/login'),('2',36000,NULL,'ROLE_CLIENT','password,authorization_code,refresh_token,client_credentials','true','util','{bcrypt}$2y$12$WBcP53NiC20Gyksn2nN5SOttJWN.kdHQz71Vt7pkSQXVbcqx/trVK',36000,'user-resource,utility-resource','foo,read,write','http://localhost:8082/login,http://localhost:8083/login,http://localhost:8084/login'),('3',36000,NULL,'ROLE_CLIENT','password,authorization_code,refresh_token,client_credentials','false','utility','{bcrypt}$2y$12$WBcP53NiC20Gyksn2nN5SOttJWN.kdHQz71Vt7pkSQXVbcqx/trVK',36000,'user-resource,utility-resource','foo,read,write','http://localhost:8082/login,http://localhost:8083/login,http://localhost:8084/login'),('4',36000,NULL,'ROLE_CLIENT','password,authorization_code,refresh_token,client_credentials','false','oauthclient','{bcrypt}$2y$12$WBcP53NiC20Gyksn2nN5SOttJWN.kdHQz71Vt7pkSQXVbcqx/trVK',36000,'user-resource,utility-resource','foo,read,write','http://localhost:8082/login,http://localhost:8083/login,http://localhost:8084/forwardLogin,http://localhost:8084/welcome'),('5',36000,NULL,'ROLE_CLIENT','password,authorization_code,refresh_token,client_credentials','false','mvcclient','{bcrypt}$2y$12$WBcP53NiC20Gyksn2nN5SOttJWN.kdHQz71Vt7pkSQXVbcqx/trVK',36000,'user-resource,utility-resource','foo,read,write','http://localhost:8082/login,http://localhost:8083/login,http://localhost:8084/login');

CREATE TABLE `permission` (
  `permission_id` int NOT NULL,
  `permission_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `permission` VALUES (1,'read_user'),(2,'create_user'),(3,'update_user'),(4,'delete_user'),(5,'read_users'),(6,'read_utility'),(7,'create_utility'),(8,'update_utility');


CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `role` VALUES (1,'user'),(2,'admin'),(3,'Manager');


CREATE TABLE `role_permission` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `FKf8yllw1ecvwqy3ehyxawqa1qp` (`permission_id`),
  CONSTRAINT `FKa6jx8n8xkesmjmv6jqug6bg68` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FKf8yllw1ecvwqy3ehyxawqa1qp` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `role_permission` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(2,6),(3,6),(2,7),(3,7),(2,8);

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `contact_number` int DEFAULT NULL,
  `dor` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `role_role_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FKs2ym81xl98n65ndx09xpwxm66` (`role_role_id`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FKs2ym81xl98n65ndx09xpwxm66` FOREIGN KEY (`role_role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `user` VALUES (1,43243,NULL,NULL,'{bcrypt}$2y$12$WBcP53NiC20Gyksn2nN5SOttJWN.kdHQz71Vt7pkSQXVbcqx/trVK',5,'pradeep',NULL,2,NULL),(2,43243,NULL,NULL,'{bcrypt}$2y$12$WBcP53NiC20Gyksn2nN5SOttJWN.kdHQz71Vt7pkSQXVbcqx/trVK',5,'suresh',NULL,1,NULL),(3,42435,NULL,NULL,'sudha.santhakumar@gmail.com',3,'santosh',NULL,3,NULL);

