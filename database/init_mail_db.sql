-- ==============================================================================
-- StripperMail Core Virtual Mail Storage Schema
-- License: MIT
-- ==============================================================================

CREATE DATABASE IF NOT EXISTS stripper_mail_db;
USE stripper_mail_db;

-- 1. Virtual Domains Table
-- Ensures the server only processes mail for authorized independent domains
CREATE TABLE IF NOT EXISTS `virtual_domains` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_domain` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Virtual Users Table
-- Stores user mailbox allocation paths and cryptographically hashed passwords
CREATE TABLE IF NOT EXISTS `virtual_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `domain_id` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL, -- Supports secure SHA512-CRYPT or bcrypt
  `mailbox_path` VARCHAR(255) NOT NULL,   -- Path to local Maildir storage
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`),
  FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Virtual Aliases Table
-- Maps dynamic routing patterns, forwards, and administrative email redirects
CREATE TABLE IF NOT EXISTS `virtual_aliases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `domain_id` INT NOT NULL,
  `source_address` VARCHAR(100) NOT NULL,
  `destination_address` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`domain_id`) REFERENCES `virtual_domains` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- High-Performance Indexes for Microsecond Retrieval Times
ALTER TABLE `virtual_users` ADD INDEX `idx_user_lookup` (`email`);
ALTER TABLE `virtual_aliases` ADD INDEX `idx_alias_lookup` (`source_address`);
