-- CreateTable
CREATE TABLE `b_file_anywhere` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `file_table_id` INTEGER NULL,
    `file_table_name` VARCHAR(255) NULL,
    `image_path` VARCHAR(255) NULL,
    `created_by` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `name` VARCHAR(191) NULL,

    INDEX `created_by_idx`(`created_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `b_user_model_action_logs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `model_id` INTEGER NULL,
    `model_name` VARCHAR(191) NULL,
    `action` VARCHAR(191) NULL,
    `description` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `barimt` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `barimt_number` VARCHAR(191) NOT NULL,
    `padan_number` INTEGER NOT NULL,
    `branch_id` INTEGER NOT NULL,
    `to_branch_id` INTEGER NULL,
    `related_barimt_id` INTEGER NULL,
    `related_barimt_number` VARCHAR(191) NULL,
    `related_padan_number` VARCHAR(191) NULL,
    `is_credit` BOOLEAN NULL DEFAULT false,
    `total_amount` DECIMAL(16, 2) NULL DEFAULT 0.00,
    `confirmed_total_amount` DECIMAL(16, 2) NULL DEFAULT 0.00,
    `total_quantity` DOUBLE NULL DEFAULT 0,
    `confirmed_total_quantity` DOUBLE NULL DEFAULT 0,
    `is_confirm` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `created_user_id` INTEGER NULL,
    `updated_user_id` INTEGER NULL,

    INDEX `barimt_created_user_id_index`(`created_user_id`),
    INDEX `barimt_updated_user_id_index`(`updated_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `basket_items` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `good_id` INTEGER NULL,
    `basket_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `good_unit_price` FLOAT NULL,
    `quantity` INTEGER NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `baskets` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `is_active` TINYINT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `beans` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,
    `body_text` TEXT NULL,
    `intro_text` VARCHAR(255) NULL,
    `origin` VARCHAR(50) NULL,
    `region` VARCHAR(50) NULL,
    `processing` VARCHAR(50) NULL,
    `altitude` VARCHAR(50) NULL,
    `harvest_period` VARCHAR(50) NULL,
    `variety` VARCHAR(255) NULL,
    `tasting_note` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `home_image` VARCHAR(255) NULL,
    `profile_image` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `branch_has_real_good` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `branch_id` INTEGER NOT NULL,
    `real_good_id` INTEGER NOT NULL,
    `price_avg` DECIMAL(8, 2) NULL,
    `available_count` DOUBLE NULL,
    `hold_count` DOUBLE NULL,
    `confirmed_price_avg` DECIMAL(8, 2) NULL,
    `confirmed_available_count` DOUBLE NULL,
    `confirmed_hold_count` DOUBLE NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `created_user_id` INTEGER NULL,
    `updated_user_id` INTEGER NULL,

    INDEX `branch_has_real_good_created_user_id_index`(`created_user_id`),
    INDEX `branch_has_real_good_updated_user_id_index`(`updated_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `branches` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `is_stock` TINYINT NULL,
    `address` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `image_path` VARCHAR(255) NULL,
    `sort_order` INTEGER NULL,
    `prefix` VARCHAR(45) NOT NULL,
    `body_text` VARCHAR(800) NULL,
    `lat` VARCHAR(40) NULL,
    `lng` VARCHAR(40) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `calendars` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `category_id` INTEGER NOT NULL,
    `start` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `end` TIMESTAMP(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
    `description` VARCHAR(191) NOT NULL,
    `allDay` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `parent_id` INTEGER UNSIGNED NULL,
    `order` INTEGER NOT NULL DEFAULT 1,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `categories_slug_unique`(`slug`),
    INDEX `categories_parent_id_foreign`(`parent_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffee_bean_logs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `import_id` INTEGER NOT NULL,
    `day_date` DATE NOT NULL,
    `weight` DECIMAL(8, 2) NOT NULL,
    `type` ENUM('ROAST', 'SALE', 'OTHER') NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffee_grinders` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `body` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffee_imports` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `bean_id` INTEGER NOT NULL,
    `bean_name` VARCHAR(191) NULL,
    `import_date` DATE NOT NULL,
    `total_weight` DECIMAL(8, 2) NOT NULL,
    `roasted_weight` DECIMAL(8, 2) NOT NULL DEFAULT 0.00,
    `saled_weight` DECIMAL(8, 2) NOT NULL DEFAULT 0.00,
    `other_weight` DECIMAL(8, 2) NOT NULL DEFAULT 0.00,
    `available_weight` DECIMAL(8, 2) NOT NULL DEFAULT 0.00,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `name` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffee_packages` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `weight` DECIMAL(5, 2) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffee_roasts` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `body` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffee_status_histories` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `coffee_unit_id` INTEGER NOT NULL,
    `status_id` INTEGER NOT NULL,
    `status_name` VARCHAR(191) NOT NULL,
    `created_by` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffee_statuses` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffee_units` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `bean_id` INTEGER NOT NULL,
    `bean_name` VARCHAR(191) NOT NULL,
    `package_id` INTEGER NOT NULL,
    `package_name` VARCHAR(191) NOT NULL,
    `roast_id` INTEGER NOT NULL,
    `roast_name` VARCHAR(191) NOT NULL,
    `grinder_id` INTEGER NOT NULL,
    `grinder_name` VARCHAR(191) NOT NULL,
    `last_branch_id` INTEGER NULL,
    `branch_name` VARCHAR(191) NULL,
    `status_id` INTEGER NULL,
    `status_name` VARCHAR(191) NULL,
    `unit_price` DECIMAL(8, 2) NULL,
    `weight` DECIMAL(8, 2) NOT NULL,
    `roast_date` DATE NOT NULL,
    `package_date` DATE NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `import_name` VARCHAR(255) NULL,
    `import_id` INTEGER NULL,
    `generate_count` INTEGER NULL,
    `is_print` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coffees` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(45) NULL,
    `image_path` VARCHAR(255) NULL,
    `category_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `body_text` TEXT NULL,
    `intro_text` VARCHAR(400) NULL,
    `price` FLOAT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `course` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NULL,
    `description` VARCHAR(1800) NULL,
    `information` VARCHAR(1800) NULL,
    `tags` VARCHAR(1800) NULL,
    `certificate_template` TEXT NULL,
    `has_certificate` BOOLEAN NOT NULL DEFAULT false,
    `exam_id` INTEGER NULL,
    `doctor_point` DOUBLE NOT NULL DEFAULT 0.00,
    `web_point` DOUBLE NOT NULL DEFAULT 0.00,
    `main_price` INTEGER NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `created_user_id` INTEGER NULL,
    `updated_user_id` INTEGER NULL,

    INDEX `course_created_user_id_index`(`created_user_id`),
    INDEX `course_updated_user_id_index`(`updated_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `data_rows` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `data_type_id` INTEGER UNSIGNED NOT NULL,
    `field` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `display_name` VARCHAR(191) NOT NULL,
    `required` BOOLEAN NOT NULL DEFAULT false,
    `browse` BOOLEAN NOT NULL DEFAULT true,
    `read` BOOLEAN NOT NULL DEFAULT true,
    `edit` BOOLEAN NOT NULL DEFAULT true,
    `add` BOOLEAN NOT NULL DEFAULT true,
    `delete` BOOLEAN NOT NULL DEFAULT true,
    `details` TEXT NULL,
    `order` INTEGER NOT NULL DEFAULT 1,

    INDEX `data_rows_data_type_id_foreign`(`data_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `data_types` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `slug` VARCHAR(191) NOT NULL,
    `display_name_singular` VARCHAR(191) NOT NULL,
    `display_name_plural` VARCHAR(191) NOT NULL,
    `icon` VARCHAR(191) NULL,
    `model_name` VARCHAR(191) NULL,
    `policy_name` VARCHAR(191) NULL,
    `controller` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `generate_permissions` BOOLEAN NOT NULL DEFAULT false,
    `server_side` TINYINT NOT NULL DEFAULT 0,
    `details` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `data_types_name_unique`(`name`),
    UNIQUE INDEX `data_types_slug_unique`(`slug`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `discount` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER NULL,
    `name` VARCHAR(191) NULL,
    `course_percent` INTEGER NOT NULL DEFAULT 0,
    `course_amount` INTEGER NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `created_user_id` INTEGER NULL,

    INDEX `discount_created_user_id_index`(`created_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NULL,
    `number` VARCHAR(191) NULL,
    `intro` VARCHAR(191) NULL,
    `attachment` VARCHAR(191) NULL,
    `company_id` INTEGER NULL,
    `company_name` VARCHAR(191) NULL,
    `company_register` VARCHAR(191) NULL,
    `status_id` INTEGER NULL,
    `document_name` VARCHAR(191) NULL,
    `document_date` VARCHAR(191) NULL,
    `document_end_date` VARCHAR(191) NULL,
    `category_id` INTEGER NULL,
    `category_name` VARCHAR(191) NULL,
    `type_id` INTEGER NULL,
    `type_name` VARCHAR(191) NULL,
    `encrypt` VARCHAR(191) NULL,
    `blank_number` VARCHAR(191) NULL,
    `user_id` INTEGER NULL,
    `template_id` INTEGER NULL,
    `created_by` INTEGER NOT NULL,
    `description` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document_category` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `type_id` INTEGER NOT NULL,
    `type_name` VARCHAR(191) NOT NULL,
    `document_template` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document_status` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `is_last` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document_status_history` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `status_id` INTEGER NULL,
    `status_name` VARCHAR(191) NOT NULL,
    `document_id` INTEGER NULL,
    `document_name` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `created_by` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document_template` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `template_text` LONGTEXT NOT NULL,
    `template_name` VARCHAR(191) NULL,
    `created_by` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `document_type` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employee_request` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `status_id` INTEGER NULL,
    `start_date` DATE NULL,
    `end_date` DATE NULL,
    `title` VARCHAR(191) NULL,
    `body` TEXT NULL,
    `image_path` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `category_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employee_request_category` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `body` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `employee_request_status` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `exam` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER NULL,
    `topic_id` INTEGER NULL,
    `lesson_id` INTEGER NULL,
    `name` VARCHAR(191) NOT NULL,
    `description` VARCHAR(1800) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `faqs` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `question` VARCHAR(255) NULL,
    `answer` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `deleted_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_address_city` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_address_district` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `city_id` INTEGER NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `bus_price` FLOAT NULL,

    INDEX `city_id_idx`(`city_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `id_card_address_id` INTEGER NULL,
    `ads_id` INTEGER NULL,
    `current_address_id` INTEGER NULL,
    `organization_id` INTEGER NULL,
    `personal_id` INTEGER NULL,
    `order_id` INTEGER NULL,
    `available_date` DATE NULL,
    `min_salary` FLOAT NULL,
    `max_salary` FLOAT NULL,
    `work_on_country` BOOLEAN NULL,
    `how_to_known` TEXT NULL,
    `mobile_number` VARCHAR(45) NULL,
    `work_number` VARCHAR(45) NULL,
    `home_number` VARCHAR(45) NULL,
    `health_info` TEXT NULL,
    `is_sent` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `is_confirm` BOOLEAN NULL,
    `confirmed_at` DATETIME(0) NULL,
    `confirm_user_id` BIGINT NULL,
    `is_interview` BOOLEAN NULL,
    `is_job_exam` BOOLEAN NULL,
    `is_skill_exam` BOOLEAN NULL,
    `is_job` BOOLEAN NULL,
    `retired_at` DATETIME(0) NULL,
    `sent_at` DATETIME(0) NULL,
    `pdf_created` BOOLEAN NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `is_english` BOOLEAN NULL,
    `is_easy` BOOLEAN NULL,

    INDEX `ads_id_idx`(`ads_id`),
    INDEX `confirm_user_id_idx`(`confirm_user_id`),
    INDEX `current_address_id_idx`(`current_address_id`),
    INDEX `id_card_address_id_idx`(`id_card_address_id`),
    INDEX `order_id_idx`(`order_id`),
    INDEX `organization_id_idx`(`organization_id`),
    INDEX `personal_id_idx`(`personal_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_decision` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `anket_id` BIGINT NULL,
    `user_id` BIGINT NULL,
    `decision_user_id` BIGINT NULL,
    `type` BIGINT NULL,
    `position_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `anket_id_idx`(`anket_id`),
    INDEX `decision_user_id_idx`(`decision_user_id`),
    INDEX `position_id_idx`(`position_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_award` (
    `anket_id` BIGINT NOT NULL,
    `award_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_award_award_id_g_user_award_id`(`award_id`),
    PRIMARY KEY (`anket_id`, `award_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_direction_contact` (
    `anket_id` BIGINT NOT NULL,
    `direction_contact_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `gdgi`(`direction_contact_id`),
    PRIMARY KEY (`anket_id`, `direction_contact_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_education` (
    `anket_id` BIGINT NOT NULL,
    `education_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_education_education_id_g_user_education_id`(`education_id`),
    PRIMARY KEY (`anket_id`, `education_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_family` (
    `anket_id` BIGINT NOT NULL,
    `family_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_family_family_id_g_user_family_id`(`family_id`),
    PRIMARY KEY (`anket_id`, `family_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_file` (
    `anket_id` BIGINT NOT NULL,
    `file_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_file_file_id_g_user_file_id`(`file_id`),
    PRIMARY KEY (`anket_id`, `file_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_language` (
    `anket_id` BIGINT NOT NULL,
    `language_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_language_language_id_g_user_language_id`(`language_id`),
    PRIMARY KEY (`anket_id`, `language_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_related_person` (
    `anket_id` INTEGER NOT NULL,
    `related_person_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`anket_id`, `related_person_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_skill` (
    `anket_id` BIGINT NOT NULL,
    `skill_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_skill_skill_id_g_user_skill_id`(`skill_id`),
    PRIMARY KEY (`anket_id`, `skill_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_software` (
    `anket_id` BIGINT NOT NULL,
    `software_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_software_software_id_g_user_software_id`(`software_id`),
    PRIMARY KEY (`anket_id`, `software_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_sport` (
    `anket_id` BIGINT NOT NULL,
    `sport_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_sport_sport_id_g_user_sport_id`(`sport_id`),
    PRIMARY KEY (`anket_id`, `sport_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_training` (
    `anket_id` BIGINT NOT NULL,
    `training_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_training_training_id_g_user_training_id`(`training_id`),
    PRIMARY KEY (`anket_id`, `training_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_has_work` (
    `anket_id` BIGINT NOT NULL,
    `work_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `g_anket_has_work_work_id_g_user_work_id`(`work_id`),
    PRIMARY KEY (`anket_id`, `work_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_interested_position` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `anket_id` BIGINT NULL,
    `position_id` INTEGER NULL,
    `department_id` INTEGER NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `anket_id_idx`(`anket_id`),
    INDEX `department_id_idx`(`department_id`),
    INDEX `position_id_idx`(`position_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_anket_related_person` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `anket_id` BIGINT NULL,
    `who_is_your` VARCHAR(45) NULL,
    `name` VARCHAR(45) NULL,
    `position` VARCHAR(255) NULL,
    `phone` VARCHAR(45) NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `anket_id_idx`(`anket_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_command` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `template_id` INTEGER NULL,
    `command_number` VARCHAR(45) NULL,
    `command_index` VARCHAR(45) NULL,
    `user_id` BIGINT NULL,
    `anket_id` BIGINT NULL,
    `organization_id` INTEGER NULL,
    `type` INTEGER NULL,
    `created_by` INTEGER NULL,
    `user_lastname` VARCHAR(255) NULL,
    `user_firstname` VARCHAR(255) NULL,
    `user_register_number` VARCHAR(20) NULL,
    `body` LONGBLOB NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `havstralt_file` VARCHAR(255) NULL,
    `page_size` VARCHAR(10) NULL,
    `is_trash` BOOLEAN NULL,
    `is_active` BOOLEAN NULL,
    `is_draft` BOOLEAN NULL,
    `start_at` DATETIME(0) NULL,
    `start_date` DATETIME(0) NULL,
    `end_date` DATETIME(0) NULL,
    `gazar_id` INTEGER NULL,
    `document_date` DATE NULL,
    `document_status_id` INTEGER NULL,
    `updated_user_id` INTEGER NULL,
    `created_user_id` INTEGER NULL,

    INDEX `anket_id_idx`(`anket_id`),
    INDEX `created_by_idx`(`created_by`),
    INDEX `g_command_created_user_id_index`(`created_user_id`),
    INDEX `g_command_updated_user_id_index`(`updated_user_id`),
    INDEX `organization_id_idx`(`organization_id`),
    INDEX `template_id_idx`(`template_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_command_attribute_value` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `command_id` INTEGER NULL,
    `attribute_id` INTEGER NULL,
    `name` TEXT NULL,
    `type` VARCHAR(255) NULL,
    `slug` TEXT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `attribute_id_idx`(`attribute_id`),
    INDEX `command_id_idx`(`command_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_command_file` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `command_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `file_path` VARCHAR(255) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `command_id_idx`(`command_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_contract` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contract_number` VARCHAR(45) NULL,
    `contract_index` VARCHAR(45) NULL,
    `user_id` INTEGER NULL,
    `organization_id` INTEGER NULL,
    `template_id` INTEGER NULL,
    `anket_id` INTEGER NULL,
    `is_active` BOOLEAN NULL,
    `is_draft` BOOLEAN NULL,
    `is_trash` BOOLEAN NULL,
    `start_at` DATETIME(0) NULL,
    `expired_type` BIGINT NULL,
    `expired_detail` TEXT NULL,
    `expired_at` DATETIME(0) NULL,
    `user_address` TEXT NULL,
    `user_familyname` VARCHAR(255) NULL,
    `user_lastname` VARCHAR(255) NULL,
    `user_firstname` VARCHAR(255) NULL,
    `user_register_number` VARCHAR(20) NULL,
    `created_by` INTEGER NULL,
    `body` LONGBLOB NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `havstralt_file` VARCHAR(255) NULL,
    `page_size` VARCHAR(10) NULL,
    `tushaal_dugaar` VARCHAR(50) NULL,
    `gazar_id` INTEGER NULL,
    `document_date` DATE NULL,
    `document_status_id` INTEGER NULL,
    `end_at` DATE NULL,

    INDEX `anket_id_idx`(`anket_id`),
    INDEX `created_by_idx`(`created_by`),
    INDEX `organization_id_idx`(`organization_id`),
    INDEX `template_id_idx`(`template_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_contract_attribute_value` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contract_id` INTEGER NULL,
    `attribute_id` INTEGER NULL,
    `name` TEXT NULL,
    `type` VARCHAR(255) NULL,
    `slug` TEXT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `attribute_id_idx`(`attribute_id`),
    INDEX `contract_id_idx`(`contract_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_contract_file` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contract_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `file_path` VARCHAR(255) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `contract_id_idx`(`contract_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_contract_property_detail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `contract_id` BIGINT NULL,
    `user_id` BIGINT NULL,
    `property_name` VARCHAR(255) NULL,
    `property_count` FLOAT NULL,
    `property_unit` VARCHAR(10) NULL,
    `property_rating` TEXT NULL,
    `property_date` TEXT NULL,
    `is_active` BOOLEAN NULL,
    `is_trash` BOOLEAN NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `contract_id_idx`(`contract_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_contract_type` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_document_status` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` INTEGER NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_template` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `body` LONGBLOB NULL,
    `is_active` BOOLEAN NULL,
    `is_endable` BOOLEAN NULL DEFAULT false,
    `created_by` INTEGER NULL,
    `organization_id` INTEGER NULL,
    `type` VARCHAR(10) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `page_size` VARCHAR(10) NULL,
    `gazar_id` INTEGER NULL,

    INDEX `created_by_idx`(`created_by`),
    INDEX `organization_id_idx`(`organization_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_template_attribute` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `template_id` INTEGER NULL,
    `name` VARCHAR(255) NULL,
    `type` VARCHAR(255) NULL,
    `slug` TEXT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `template_id_idx`(`template_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_address` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `city_id` INTEGER NULL,
    `district_id` INTEGER NULL,
    `street` VARCHAR(255) NULL,
    `address` TEXT NULL,
    `type` BIGINT NULL,
    `is_map` BOOLEAN NULL,
    `longitude` VARCHAR(45) NULL,
    `latitude` VARCHAR(45) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `city_id_idx`(`city_id`),
    INDEX `district_id_idx`(`district_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_award` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `given_organization` VARCHAR(255) NULL,
    `taken_year` VARCHAR(10) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_direction_contact` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `who_is_your` VARCHAR(45) NULL,
    `phone` VARCHAR(45) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `work` VARCHAR(255) NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_education` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `location` VARCHAR(255) NULL,
    `school_name` VARCHAR(255) NULL,
    `start_year` VARCHAR(10) NULL,
    `end_year` VARCHAR(10) NULL,
    `major` VARCHAR(255) NULL,
    `degree` VARCHAR(255) NULL,
    `avarage` FLOAT NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_family` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `who_is_your` VARCHAR(255) NULL,
    `name` VARCHAR(45) NULL,
    `birthday` DATE NULL,
    `birthplace` VARCHAR(255) NULL,
    `major` VARCHAR(255) NULL,
    `organization_name` VARCHAR(255) NULL,
    `job_position` VARCHAR(255) NULL,
    `phone` VARCHAR(45) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `register_number` VARCHAR(45) NULL,
    `address` VARCHAR(255) NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_file` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `file_path` VARCHAR(255) NULL,
    `type` BIGINT NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_gazar` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `gazar_id` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_group_history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `worker_id` INTEGER NULL,
    `group_id` INTEGER NULL,
    `created_by` INTEGER NULL,
    `description` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `created_by_idx`(`created_by`),
    INDEX `group_id_idx`(`group_id`),
    INDEX `worker_id_idx`(`worker_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_has_job` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `anket_id` BIGINT NULL,
    `user_id` BIGINT NULL,
    `organization_id` INTEGER NULL,
    `is_active` BOOLEAN NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `anket_id_idx`(`anket_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_language` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `duration` BIGINT NULL,
    `duration_unit` VARCHAR(45) NULL,
    `listening` VARCHAR(45) NULL,
    `speaking` VARCHAR(45) NULL,
    `reading` VARCHAR(45) NULL,
    `level` VARCHAR(45) NULL,
    `exam` VARCHAR(255) NULL,
    `exam_point` FLOAT NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_organization` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `organization_id` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `g_user_organization_user_id_organization_id_unique`(`user_id`, `organization_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_out_category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `type_id` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `type_id_idx`(`type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_out_category_type` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_personal` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `familyname` VARCHAR(255) NULL,
    `lastname` VARCHAR(255) NULL,
    `firstname` VARCHAR(255) NULL,
    `gender` VARCHAR(10) NULL,
    `birthday` DATE NULL,
    `email` VARCHAR(255) NULL,
    `register_number` VARCHAR(45) NULL,
    `driver_license_has` BOOLEAN NULL,
    `driver_license_number` VARCHAR(45) NULL,
    `driver_license_classes` VARCHAR(45) NULL,
    `driver_license_other` VARCHAR(255) NULL,
    `driver_license_given_year` VARCHAR(10) NULL,
    `file_path` VARCHAR(255) NULL,
    `has_own_car` BOOLEAN NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `is_tsereg` BOOLEAN NULL DEFAULT false,
    `birthplace` VARCHAR(255) NULL,
    `is_married` BOOLEAN NULL,
    `yas_undes` VARCHAR(45) NULL,
    `photo` VARCHAR(255) NULL,

    INDEX `id`(`id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_related_person` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `related_user_id` INTEGER NULL,
    `who_is_your` VARCHAR(45) NULL,
    `name` VARCHAR(255) NULL,
    `department` VARCHAR(255) NULL,
    `position` VARCHAR(255) NULL,
    `phone` VARCHAR(45) NULL,
    `is_active` BOOLEAN NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `is_trash` BOOLEAN NULL DEFAULT false,

    INDEX `related_user_id_idx`(`related_user_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_skill` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `your_skill` TEXT NULL,
    `need_skill` TEXT NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_software` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `level` VARCHAR(45) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_sport` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `practice_year` VARCHAR(45) NULL,
    `level` VARCHAR(100) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_stats` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `interview_count` INTEGER NULL,
    `interview_duration` FLOAT NULL,
    `interview_lead_count` INTEGER NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    UNIQUE INDEX `user_id`(`user_id`),
    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_training` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `name` VARCHAR(255) NULL,
    `location` VARCHAR(255) NULL,
    `school_name` VARCHAR(255) NULL,
    `learning_date` DATETIME(0) NULL,
    `learning_time` VARCHAR(255) NULL,
    `learning_unit` VARCHAR(255) NULL,
    `is_trash` BOOLEAN NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `learning_skill` VARCHAR(255) NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_work` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NULL,
    `organization_name` VARCHAR(255) NULL,
    `organization_area` VARCHAR(255) NULL,
    `position_name` VARCHAR(255) NULL,
    `position_role` VARCHAR(255) NULL,
    `award` TEXT NULL,
    `main_salary` FLOAT NULL,
    `bonus_salary` FLOAT NULL,
    `over_salary` FLOAT NULL,
    `other_salary` FLOAT NULL,
    `total_salary` FLOAT NULL,
    `phone_salary` FLOAT NULL,
    `transport_salary` FLOAT NULL,
    `in_date` DATE NULL,
    `out_date` DATE NULL,
    `director_name` VARCHAR(255) NULL,
    `director_position_name` VARCHAR(255) NULL,
    `director_phone` VARCHAR(45) NULL,
    `enjoy` TEXT NULL,
    `un_enjoy` TEXT NULL,
    `out_cause` TEXT NULL,
    `created_by` BIGINT NULL,
    `updated_by` BIGINT NULL,
    `is_active` BOOLEAN NULL,
    `is_trash` BOOLEAN NULL,
    `sort_order` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `is_ndsh` TINYINT NULL,

    INDEX `user_id_idx`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_work_time` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `is_shift` BOOLEAN NULL DEFAULT true,
    `start_at` TIME(0) NULL,
    `end_at` TIME(0) NULL,
    `start_at_second` TIME(0) NULL,
    `end_at_second` TIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `branch_id` INTEGER NULL,
    `duration` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `g_user_work_type` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `good_parent_attributes` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `good_parent_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `name` VARCHAR(255) NULL,
    `body` VARCHAR(500) NULL,
    `image` VARCHAR(255) NULL,
    `type_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `good_parents` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `image_path` VARCHAR(255) NULL,
    `is_shop` TINYINT NOT NULL DEFAULT 1,
    `body_text` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `slug` VARCHAR(255) NULL,
    `mn_name` VARCHAR(191) NULL,
    `mn_body_text` TEXT NULL,
    `is_show_in_site` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `good_sizes` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `good_types` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `body_text` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `goods` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `sort_order` INTEGER NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `price` FLOAT NOT NULL,
    `parent_good_id` INTEGER NOT NULL,
    `size_id` INTEGER NOT NULL,
    `type_id` INTEGER NOT NULL,
    `image_path` VARCHAR(255) NULL,
    `is_available_shop` BOOLEAN NOT NULL DEFAULT true,
    `introduction_pdf` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoice` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER NULL,
    `description` VARCHAR(800) NULL,
    `user_id` INTEGER NULL,
    `main_amount` INTEGER NOT NULL DEFAULT 0,
    `paid_amount` INTEGER NOT NULL DEFAULT 0,
    `discount` INTEGER NOT NULL DEFAULT 0,
    `hash` VARCHAR(191) NOT NULL,
    `number` VARCHAR(191) NOT NULL,
    `qpay_json` VARCHAR(191) NULL,
    `account_bank_name` VARCHAR(191) NULL,
    `account_number` VARCHAR(191) NULL,
    `amount` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoice_items` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `good_id` INTEGER NULL,
    `invoice_id` INTEGER NULL,
    `order_id` INTEGER NULL,
    `unit_price` FLOAT NULL,
    `quantity` INTEGER NULL,
    `total_price` INTEGER NULL,
    `organization_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `phone` VARCHAR(25) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoices` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` INTEGER NOT NULL,
    `user_id` DOUBLE NULL,
    `organization_id` DOUBLE NULL,
    `number` VARCHAR(45) NOT NULL,
    `grand_total` FLOAT NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `is_paid` TINYINT NULL DEFAULT 0,
    `hash` VARCHAR(50) NULL,
    `qpay_json` TEXT NULL,
    `phone` VARCHAR(25) NULL,
    `approve_code` VARCHAR(25) NULL,
    `is_approved` BOOLEAN NOT NULL DEFAULT false,
    `active_time` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `job_position` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lesson` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `topic_id` INTEGER NULL,
    `free_to_view` BOOLEAN NOT NULL DEFAULT false,
    `name` VARCHAR(191) NOT NULL,
    `video_name` VARCHAR(191) NULL,
    `video_link` VARCHAR(191) NULL,
    `description` VARCHAR(1800) NULL,
    `information` VARCHAR(1800) NULL,
    `full_text` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `created_user_id` INTEGER NULL,

    INDEX `lesson_created_user_id_index`(`created_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `menu_items` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `menu_id` INTEGER UNSIGNED NULL,
    `title` VARCHAR(191) NOT NULL,
    `url` VARCHAR(191) NOT NULL,
    `target` VARCHAR(191) NOT NULL DEFAULT '_self',
    `icon_class` VARCHAR(191) NULL,
    `color` VARCHAR(191) NULL,
    `parent_id` INTEGER NULL,
    `order` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `route` VARCHAR(191) NULL,
    `parameters` TEXT NULL,

    INDEX `menu_items_menu_id_foreign`(`menu_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `menus` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `menus_name_unique`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `messages` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NULL,
    `email` VARCHAR(50) NULL,
    `message` TEXT NULL,
    `subject` VARCHAR(50) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migrations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `migration` VARCHAR(191) NOT NULL,
    `batch` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_items` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `good_id` INTEGER NULL,
    `quantity` INTEGER NULL,
    `unit_price` FLOAT NULL,
    `total_price` FLOAT NULL,
    `order_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `phone` VARCHAR(25) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_status` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_status_history` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` INTEGER NULL,
    `status_id` INTEGER NULL,
    `status_name` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `orders` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `organization_id` INTEGER NULL,
    `is_payed` TINYINT NULL DEFAULT 0,
    `status_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `number` VARCHAR(45) NOT NULL,
    `phone` VARCHAR(25) NULL,
    `approve_code` VARCHAR(25) NULL,
    `address` VARCHAR(191) NULL,
    `griner_type` VARCHAR(191) NULL,
    `receiver_name` VARCHAR(191) NULL,
    `company_name` VARCHAR(191) NULL,
    `company_register` VARCHAR(191) NULL,
    `is_approved` BOOLEAN NOT NULL DEFAULT false,
    `active_time` DATETIME(0) NOT NULL,
    `grinder_type` INTEGER NULL,
    `total_price` DOUBLE NULL,
    `total_quantity` DOUBLE NULL,
    `total_good` DOUBLE NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `organizations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `our_teams` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(50) NULL,
    `lastname` VARCHAR(50) NULL,
    `insta_link` VARCHAR(255) NULL,
    `job_title` VARCHAR(50) NULL,
    `profile_image` VARCHAR(255) NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `page_card` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `section_id` INTEGER NOT NULL,
    `order` INTEGER NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `name` VARCHAR(255) NULL,
    `image` VARCHAR(255) NULL,
    `link` VARCHAR(255) NULL,
    `description` VARCHAR(1800) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `created_user_id` INTEGER NULL,

    INDEX `page_card_created_user_id_index`(`created_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `page_section` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `order` INTEGER NOT NULL,
    `is_before_main_content` BOOLEAN NOT NULL,
    `page_name` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `image` VARCHAR(255) NULL,
    `link` VARCHAR(255) NULL,
    `description` VARCHAR(1800) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `created_user_id` INTEGER NULL,

    INDEX `page_section_created_user_id_index`(`created_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pages` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `author_id` INTEGER NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `excerpt` TEXT NULL,
    `body` TEXT NULL,
    `image` VARCHAR(191) NULL,
    `slug` VARCHAR(191) NOT NULL,
    `meta_description` TEXT NULL,
    `meta_keywords` TEXT NULL,
    `status` ENUM('ACTIVE', 'INACTIVE') NOT NULL DEFAULT 'INACTIVE',
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `pages_slug_unique`(`slug`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `password_resets` (
    `email` VARCHAR(191) NOT NULL,
    `token` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,

    INDEX `password_resets_email_index`(`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payments` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` INTEGER NULL,
    `total` FLOAT NULL,
    `description` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `invoice_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permission_role` (
    `permission_id` BIGINT UNSIGNED NOT NULL,
    `role_id` BIGINT UNSIGNED NOT NULL,

    INDEX `permission_role_permission_id_index`(`permission_id`),
    INDEX `permission_role_role_id_index`(`role_id`),
    PRIMARY KEY (`permission_id`, `role_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permissions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `key` VARCHAR(191) NOT NULL,
    `table_name` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `permissions_key_index`(`key`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `personal_access_tokens` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tokenable_type` VARCHAR(191) NOT NULL,
    `tokenable_id` BIGINT UNSIGNED NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `token` VARCHAR(64) NOT NULL,
    `abilities` TEXT NULL,
    `last_used_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `personal_access_tokens_token_unique`(`token`),
    INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `posts` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `author_id` INTEGER NOT NULL,
    `category_id` INTEGER NULL,
    `title` VARCHAR(191) NOT NULL,
    `seo_title` VARCHAR(191) NULL,
    `excerpt` TEXT NULL,
    `body` TEXT NOT NULL,
    `image` VARCHAR(191) NULL,
    `slug` VARCHAR(191) NOT NULL,
    `meta_description` TEXT NULL,
    `meta_keywords` TEXT NULL,
    `status` ENUM('PUBLISHED', 'DRAFT', 'PENDING') NOT NULL DEFAULT 'DRAFT',
    `featured` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `posts_slug_unique`(`slug`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `punch_log` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `branch_id` INTEGER NOT NULL,
    `device_id` VARCHAR(40) NOT NULL,
    `lat` VARCHAR(40) NOT NULL,
    `lng` VARCHAR(40) NOT NULL,
    `day_date` DATE NOT NULL,
    `time` DATETIME(0) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `punch_type` INTEGER NULL,
    `end_time` DATETIME(0) NULL,
    `work_duration` INTEGER NULL,
    `image_path` VARCHAR(400) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `real_good` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `bean_id` INTEGER NULL,
    `bean_name` VARCHAR(191) NULL,
    `package_id` INTEGER NULL,
    `package_name` VARCHAR(191) NULL,
    `unit_price` DECIMAL(16, 2) NULL,
    `sanhuu_dugaar` VARCHAR(191) NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `created_user_id` INTEGER NULL,
    `updated_user_id` INTEGER NULL,

    INDEX `real_good_created_user_id_index`(`created_user_id`),
    INDEX `real_good_updated_user_id_index`(`updated_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `real_good_transaction` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `branch_id` INTEGER NOT NULL,
    `to_branch_id` INTEGER NULL,
    `related_transaction_id` INTEGER NULL,
    `real_good_id` INTEGER NOT NULL,
    `price_avg` DECIMAL(8, 2) NULL,
    `credit_count` DOUBLE NULL,
    `debit_count` DOUBLE NULL,
    `confirmed_price_avg` DECIMAL(8, 2) NULL,
    `confirmed_credit_count` DOUBLE NULL,
    `confirmed_debit_count` DOUBLE NULL,
    `is_confirm` BOOLEAN NOT NULL DEFAULT false,
    `barimt_id` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `created_user_id` INTEGER NULL,
    `updated_user_id` INTEGER NULL,

    INDEX `real_good_transaction_created_user_id_index`(`created_user_id`),
    INDEX `real_good_transaction_updated_user_id_index`(`updated_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roles` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `display_name` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `roles_name_unique`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `category_id` INTEGER NOT NULL,
    `name` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `body` TEXT NULL,
    `image_path` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `service_category` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `body` TEXT NULL,
    `image_path` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `settings` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `key` VARCHAR(191) NOT NULL,
    `display_name` VARCHAR(191) NOT NULL,
    `value` TEXT NULL,
    `details` TEXT NULL,
    `type` VARCHAR(191) NOT NULL,
    `order` INTEGER NOT NULL DEFAULT 1,
    `group` VARCHAR(191) NULL,

    UNIQUE INDEX `settings_key_unique`(`key`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sf_guard_group` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `description` TEXT NULL,
    `organization_id` INTEGER NULL,
    `cheif_id` BIGINT NULL,
    `created_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updated_at` DATETIME(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    UNIQUE INDEX `name`(`name`),
    INDEX `cheif_id_idx`(`cheif_id`),
    INDEX `organization_id_idx`(`organization_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sf_guard_user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `email_address` VARCHAR(255) NULL,
    `username` VARCHAR(128) NULL,
    `is_active` BOOLEAN NULL DEFAULT true,
    `is_confirm` BOOLEAN NULL DEFAULT false,
    `phone` VARCHAR(50) NULL,
    `address` VARCHAR(255) NULL,
    `profile_image` VARCHAR(255) NULL,
    `organization_id` INTEGER NULL,
    `sector_id` INTEGER NULL,
    `department_id` INTEGER NULL,
    `position_id` INTEGER NULL,
    `nas` INTEGER NULL,
    `huis` VARCHAR(255) NULL,
    `ndd` VARCHAR(50) NULL,
    `emdd` VARCHAR(50) NULL,
    `ajillasan_jil` VARCHAR(50) NULL,
    `register_number` VARCHAR(50) NULL,
    `geree_ehelsen` DATE NULL,
    `geree_duusah` DATE NULL,
    `kart_dugaar` VARCHAR(50) NULL,
    `dans_dugaar` VARCHAR(50) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,
    `birthday` DATE NULL,
    `alban_tushaal_id` INTEGER NULL,
    `job_type_id` INTEGER NULL,
    `position_name` VARCHAR(255) NULL,
    `group_reason` TEXT NULL,
    `command_number` VARCHAR(50) NULL,
    `description` TEXT NULL,
    `status_id` INTEGER NULL,
    `out_category_id` INTEGER NULL,
    `out_text` VARCHAR(400) NULL,
    `work_time_id` INTEGER NULL,
    `out_category_type_id` INTEGER NULL,
    `work_type_id` INTEGER NULL,
    `department_name` VARCHAR(255) NULL,
    `group_name` VARCHAR(255) NULL,
    `employee_id` INTEGER NULL,
    `employee_code` VARCHAR(40) NULL,
    `password` VARCHAR(45) NULL,
    `degree_name` VARCHAR(191) NULL,
    `major_name` VARCHAR(191) NULL,
    `atk` INTEGER NULL,
    `yamat` INTEGER NULL,
    `in_date` DATE NULL,
    `contract_number` VARCHAR(191) NULL,
    `work_year_bonus` INTEGER NULL,
    `food_bonus` INTEGER NULL,
    `road_bonus` INTEGER NULL,
    `distance_work` INTEGER NULL,
    `out_date` DATE NULL,
    `fb_user_id` VARCHAR(255) NULL,

    INDEX `alban_tushaal_id`(`alban_tushaal_id`),
    INDEX `department_id_idx`(`department_id`),
    INDEX `id`(`id`),
    INDEX `is_active_idx_idx`(`is_active`),
    INDEX `job_type_id`(`job_type_id`),
    INDEX `organization_id_idx`(`organization_id`),
    INDEX `position_id_idx`(`position_id`),
    INDEX `sector_id_idx`(`sector_id`),
    INDEX `sf_guard_user_status_id_user_status_id`(`status_id`),
    INDEX `sf_guard_user_work_time_id_g_user_work_time_id`(`work_time_id`),
    INDEX `sf_guard_user_work_type_id_g_user_work_type_id`(`work_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sf_guard_user_additional_time` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `branch_id` INTEGER NULL,
    `service_id` INTEGER NULL,
    `approved_user_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `udur_tsag_ajil` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag` INTEGER NOT NULL DEFAULT 0,
    `udur_tsag_amralt` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_ajil` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_amralt` INTEGER NOT NULL DEFAULT 0,
    `udur_tsag_bayar` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_bayar` INTEGER NOT NULL DEFAULT 0,
    `sul_zogsolt` INTEGER NOT NULL DEFAULT 0,
    `day_zam_tsag` INTEGER NOT NULL DEFAULT 0,
    `travel_zam_tsag` INTEGER NOT NULL DEFAULT 0,
    `work_duration` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag_night` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag_day` INTEGER NOT NULL DEFAULT 0,
    `day_date` DATE NULL,
    `start_at_punch` DATETIME(0) NULL,
    `end_at_punch` DATETIME(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sf_guard_user_branch` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `branch_id` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `start_at` VARCHAR(40) NULL,
    `end_at` VARCHAR(40) NULL,
    `start_at_second` VARCHAR(40) NULL,
    `end_at_second` VARCHAR(40) NULL,
    `devices` VARCHAR(400) NULL,

    UNIQUE INDEX `sf_guard_user_branch_branch_id_user_id_unique`(`branch_id`, `user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sf_guard_user_device_on_branch` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `branch_id` INTEGER NOT NULL,
    `mac_address` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sf_guard_user_group` (
    `user_id` BIGINT NOT NULL,
    `group_id` BIGINT NOT NULL,
    `organization_id` INTEGER NULL,
    `role` VARCHAR(50) NULL,
    `created_at` DATETIME(0) NOT NULL,
    `updated_at` DATETIME(0) NOT NULL,

    INDEX `sf_guard_user_group_group_id_sf_guard_group_id`(`group_id`),
    PRIMARY KEY (`user_id`, `group_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sf_guard_user_work_day_log` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `branch_id` INTEGER NOT NULL,
    `day_date` DATE NULL,
    `start_at` DATETIME(0) NULL,
    `end_at` DATETIME(0) NULL,
    `start_at_second` DATETIME(0) NULL,
    `end_at_second` DATETIME(0) NULL,
    `start_at_punch` DATETIME(0) NULL,
    `end_at_punch` DATETIME(0) NULL,
    `start_at_second_punch` DATETIME(0) NULL,
    `end_at_second_punch` DATETIME(0) NULL,
    `work_duration` DOUBLE NOT NULL DEFAULT 0.00,
    `work_duration_second` DOUBLE NOT NULL DEFAULT 0.00,
    `work_duration_sum` DOUBLE NOT NULL DEFAULT 0.00,
    `iluu_tsag` DOUBLE NOT NULL DEFAULT 0.00,
    `iluu_tsag_approved` DOUBLE NOT NULL DEFAULT 0.00,
    `is_hotsorson` BOOLEAN NOT NULL DEFAULT false,
    `is_ert_tarsan` BOOLEAN NOT NULL DEFAULT false,
    `status_id` INTEGER NULL,
    `must_punch` BOOLEAN NOT NULL DEFAULT false,
    `work_time_multi` DOUBLE NOT NULL DEFAULT 0.00,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `created_by` INTEGER NOT NULL,
    `work_time_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sms_log` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `message_id` INTEGER NULL,
    `code` VARCHAR(191) NULL,
    `text` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `active_time` DATETIME(0) NOT NULL,
    `result` TEXT NOT NULL,
    `result_data` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `order_information` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stock_balances` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `stock_id` INTEGER NULL,
    `good_id` INTEGER NULL,
    `unit_price` FLOAT NULL,
    `quantity` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `deleted_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stock_goods` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `stock_id` INTEGER NULL,
    `good_id` INTEGER NULL,
    `unit_price` FLOAT NULL,
    `quantity` FLOAT NULL,
    `total_price` FLOAT NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tags` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `created_user_id` INTEGER NULL,

    INDEX `tags_created_user_id_index`(`created_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `teacher` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `full_name` VARCHAR(255) NOT NULL,
    `organization` VARCHAR(255) NOT NULL,
    `position` VARCHAR(255) NOT NULL,
    `major` VARCHAR(400) NOT NULL,
    `image` VARCHAR(255) NULL,
    `course_count` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `topic` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER NULL,
    `name` VARCHAR(191) NOT NULL,
    `exam_id` INTEGER NULL,
    `description` VARCHAR(1800) NULL,
    `information` VARCHAR(1800) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `created_user_id` INTEGER NULL,

    INDEX `topic_created_user_id_index`(`created_user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaction_items` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `good_id` INTEGER NULL,
    `quantity` FLOAT NULL,
    `stock_id` INTEGER NULL,
    `to_stock_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `to_user_id` INTEGER NULL,
    `transaction_at` DATETIME(0) NULL,
    `is_active` TINYINT NULL DEFAULT 1,
    `unit_price` FLOAT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `transaction_id` INTEGER NULL,
    `type` INTEGER NULL,

    UNIQUE INDEX `test`(`good_id`, `transaction_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaction_types` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transactions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `number` VARCHAR(45) NOT NULL,
    `user_id` INTEGER NULL,
    `to_user_id` INTEGER NULL,
    `stock_id` INTEGER NOT NULL,
    `related_stock_id` INTEGER NULL,
    `transaction_at` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `is_confirmed` INTEGER NULL,
    `item_count` FLOAT NULL,
    `type` INTEGER NOT NULL,
    `related_transaction_id` INTEGER NULL,
    `order_id` INTEGER NULL,
    `description` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `translations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `table_name` VARCHAR(191) NOT NULL,
    `column_name` VARCHAR(191) NOT NULL,
    `foreign_key` INTEGER UNSIGNED NOT NULL,
    `locale` VARCHAR(191) NOT NULL,
    `value` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `translations_table_name_column_name_foreign_key_locale_unique`(`table_name`, `column_name`, `foreign_key`, `locale`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tsalin_main_report` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `start_date` DATE NULL,
    `end_date` DATE NULL,
    `description` VARCHAR(191) NULL,
    `created_hr` INTEGER NULL,
    `approved_chief` INTEGER NULL,
    `approved_ceo` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tsalin_report` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `main_report_id` INTEGER NULL,
    `start_date` DATE NULL,
    `end_date` DATE NULL,
    `employee_id` INTEGER NULL,
    `employee_name` VARCHAR(191) NULL,
    `register_number` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `department_id` VARCHAR(191) NULL,
    `department_name` VARCHAR(191) NULL,
    `heltes_id` VARCHAR(191) NULL,
    `heltes_name` VARCHAR(191) NULL,
    `organization_id` VARCHAR(191) NULL,
    `organization_name` VARCHAR(191) NULL,
    `udur_tsag_ajil` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag` INTEGER NOT NULL DEFAULT 0,
    `udur_tsag_amralt` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_ajil` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_amralt` INTEGER NOT NULL DEFAULT 0,
    `udur_tsag_bayar` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_bayar` INTEGER NOT NULL DEFAULT 0,
    `sul_zogsolt` INTEGER NOT NULL DEFAULT 0,
    `day_zam_tsag` INTEGER NOT NULL DEFAULT 0,
    `travel_zam_tsag` INTEGER NOT NULL DEFAULT 0,
    `work_duration` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag_night` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag_day` INTEGER NOT NULL DEFAULT 0,
    `worked_day_count` INTEGER NOT NULL DEFAULT 0,
    `must_work_day_count` INTEGER NOT NULL DEFAULT 0,
    `sum` INTEGER NOT NULL DEFAULT 0,
    `created_hr` INTEGER NULL,
    `approved_chief` INTEGER NULL,
    `approved_ceo` INTEGER NULL,
    `description` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `branch_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tsalin_report_daily_report` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NULL,
    `employee_name` VARCHAR(191) NULL,
    `register_number` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `department_id` VARCHAR(191) NULL,
    `department_name` VARCHAR(191) NULL,
    `heltes_id` VARCHAR(191) NULL,
    `heltes_name` VARCHAR(191) NULL,
    `organization_id` VARCHAR(191) NULL,
    `organization_name` VARCHAR(191) NULL,
    `day_date` DATE NULL,
    `udur_tsag_ajil` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag` INTEGER NOT NULL DEFAULT 0,
    `udur_tsag_amralt` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_ajil` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_amralt` INTEGER NOT NULL DEFAULT 0,
    `udur_tsag_bayar` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_bayar` INTEGER NOT NULL DEFAULT 0,
    `sul_zogsolt` INTEGER NOT NULL DEFAULT 0,
    `day_zam_tsag` INTEGER NOT NULL DEFAULT 0,
    `travel_zam_tsag` INTEGER NOT NULL DEFAULT 0,
    `shift` INTEGER NOT NULL DEFAULT 0,
    `work_duration` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag_night` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag_day` INTEGER NOT NULL DEFAULT 0,
    `start_at` DATETIME(0) NULL,
    `end_at` DATETIME(0) NULL,
    `work_start_at` DATETIME(0) NULL,
    `work_end_at` DATETIME(0) NULL,
    `created_hr` INTEGER NULL,
    `approved_chief` INTEGER NULL,
    `approved_ceo` INTEGER NULL,
    `description` VARCHAR(191) NULL,
    `punch_logs` VARCHAR(191) NULL,
    `main_report_id` INTEGER NULL,
    `sum` INTEGER NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `branch_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tsalin_report_daily_report_logs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `branch_id` INTEGER NOT NULL,
    `device_id` VARCHAR(40) NOT NULL,
    `lat` VARCHAR(40) NOT NULL,
    `lng` VARCHAR(40) NOT NULL,
    `lat_end` VARCHAR(40) NOT NULL,
    `lng_end` VARCHAR(40) NOT NULL,
    `distance` VARCHAR(40) NOT NULL,
    `day_date` DATE NOT NULL,
    `time` DATETIME(0) NOT NULL,
    `end_time` DATETIME(0) NULL,
    `work_duration` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `punch_type` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tsalin_report_detail_logs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `employee_id` INTEGER NOT NULL,
    `branch_id` INTEGER NOT NULL,
    `device_id` VARCHAR(40) NOT NULL,
    `lat` VARCHAR(40) NOT NULL,
    `lng` VARCHAR(40) NOT NULL,
    `lat_end` VARCHAR(40) NOT NULL,
    `lng_end` VARCHAR(40) NOT NULL,
    `distance` VARCHAR(40) NOT NULL,
    `day_date` DATE NOT NULL,
    `time` DATETIME(0) NOT NULL,
    `end_time` DATETIME(0) NULL,
    `work_duration` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `punch_type` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tsalin_report_details` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `tsalin_report_id` INTEGER NULL,
    `employee_id` INTEGER NULL,
    `employee_name` VARCHAR(191) NULL,
    `register_number` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `department_id` VARCHAR(191) NULL,
    `department_name` VARCHAR(191) NULL,
    `heltes_id` VARCHAR(191) NULL,
    `heltes_name` VARCHAR(191) NULL,
    `organization_id` VARCHAR(191) NULL,
    `organization_name` VARCHAR(191) NULL,
    `day_date` DATE NULL,
    `udur_tsag_ajil` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag` INTEGER NOT NULL DEFAULT 0,
    `udur_tsag_amralt` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_ajil` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_amralt` INTEGER NOT NULL DEFAULT 0,
    `udur_tsag_bayar` INTEGER NOT NULL DEFAULT 0,
    `shunu_tsag_bayar` INTEGER NOT NULL DEFAULT 0,
    `sul_zogsolt` INTEGER NOT NULL DEFAULT 0,
    `day_zam_tsag` INTEGER NOT NULL DEFAULT 0,
    `travel_zam_tsag` INTEGER NOT NULL DEFAULT 0,
    `shift` INTEGER NOT NULL DEFAULT 0,
    `work_duration` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag_night` INTEGER NOT NULL DEFAULT 0,
    `iluu_tsag_day` INTEGER NOT NULL DEFAULT 0,
    `start_at` DATETIME(0) NULL,
    `end_at` DATETIME(0) NULL,
    `work_start_at` DATETIME(0) NULL,
    `work_end_at` DATETIME(0) NULL,
    `created_hr` INTEGER NULL,
    `approved_chief` INTEGER NULL,
    `approved_ceo` INTEGER NULL,
    `description` VARCHAR(191) NULL,
    `punch_logs` VARCHAR(191) NULL,
    `main_report_id` INTEGER NULL,
    `sum` INTEGER NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `branch_id` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_course` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER NULL,
    `user_id` INTEGER NULL,
    `paid_amount` INTEGER NOT NULL DEFAULT 0,
    `invoice_id` INTEGER NULL,
    `is_end` INTEGER NULL,
    `doctor_point` INTEGER NOT NULL DEFAULT 0,
    `certificate` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_model_settings` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `data_type_id` INTEGER NOT NULL,
    `details` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_roles` (
    `user_id` BIGINT UNSIGNED NOT NULL,
    `role_id` BIGINT UNSIGNED NOT NULL,

    INDEX `user_roles_role_id_index`(`role_id`),
    INDEX `user_roles_user_id_index`(`user_id`),
    PRIMARY KEY (`user_id`, `role_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_wallet` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `total_amount` INTEGER NULL,
    `total_web_point` DOUBLE NULL,
    `total_doctor_point` DOUBLE NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_wallet_transaction` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `credit_doctor_point` DOUBLE NULL,
    `debit_doctor_point` DOUBLE NULL,
    `credit_web_point` DOUBLE NULL,
    `debit_web_point` DOUBLE NULL,
    `credit_amount` DOUBLE NULL,
    `debit_amount` DOUBLE NULL,
    `type` ENUM('doctor_point', 'web_point', 'amount') NOT NULL DEFAULT 'doctor_point',
    `status` ENUM('Pending', 'Wait', 'Active') NOT NULL DEFAULT 'Pending',
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `role_id` BIGINT UNSIGNED NULL,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `avatar` VARCHAR(191) NULL DEFAULT 'users/default.png',
    `email_verified_at` TIMESTAMP(0) NULL,
    `password` VARCHAR(191) NOT NULL,
    `remember_token` VARCHAR(100) NULL,
    `settings` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `organization_id` INTEGER NULL,
    `branch_id` INTEGER NULL,
    `last_name` VARCHAR(45) NULL,
    `phone` VARCHAR(45) NULL,
    `employee_code` VARCHAR(40) NULL,
    `degree_name` VARCHAR(191) NULL,
    `position_name` VARCHAR(191) NULL,
    `major_name` VARCHAR(191) NULL,
    `atk` INTEGER NULL,
    `yamat` INTEGER NULL,
    `in_date` DATE NULL,
    `contract_number` VARCHAR(191) NULL,
    `address` VARCHAR(191) NULL,
    `work_year_bonus` INTEGER NULL,
    `food_bonus` INTEGER NULL,
    `road_bonus` INTEGER NULL,
    `distance_work` INTEGER NULL,
    `out_date` DATE NULL,

    UNIQUE INDEX `users_email_unique`(`email`),
    INDEX `users_role_id_foreign`(`role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `work_at_roc` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(191) NULL,
    `last_name` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `major` VARCHAR(191) NULL,
    `position_id` INTEGER NULL,
    `status_id` INTEGER NULL,
    `degree_name` VARCHAR(191) NULL,
    `birth_day` DATE NULL,
    `additional_information` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `work_at_roc_status` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `work_day_plan` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NULL,
    `branch_id` INTEGER NULL,
    `work_time_id` INTEGER NULL,
    `day_date` DATE NULL,
    `created_by` INTEGER NULL,
    `description` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `work_position` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NULL,
    `description` VARCHAR(191) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `work_status` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `is_working` BOOLEAN NOT NULL DEFAULT true,
    `must_punch` BOOLEAN NOT NULL DEFAULT true,
    `work_time_multi` DOUBLE NOT NULL DEFAULT 0.00,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `data_rows` ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `menu_items` ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `permission_role` ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `permission_role` ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user_roles` ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `user_roles` ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `users` ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

