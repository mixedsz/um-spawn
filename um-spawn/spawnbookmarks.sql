-- um-spawn bookmark table
-- Import this file once into your database before starting the resource.

CREATE TABLE IF NOT EXISTS `spawnbookmarks` (
  `id`       int(11)       NOT NULL AUTO_INCREMENT,
  `license`  varchar(60)   NOT NULL,
  `name`     varchar(50)   NOT NULL,
  `image`    varchar(255)  DEFAULT NULL,
  `location` longtext      DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
