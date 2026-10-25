sqlite3 instance/teach_cloud.db
SQLite version 3.45.1 2024-01-30 16:01:20
Enter ".help" for usage hints.
sqlite> .schema
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE user (
        id INTEGER NOT NULL, 
        username VARCHAR(80) NOT NULL, 
        email VARCHAR(100) NOT NULL, 
        image_pro VARCHAR(20) NOT NULL, 
        password VARCHAR(128) NOT NULL, 
        first_name VARCHAR(50), 
        last_name VARCHAR(50), 
        phone VARCHAR(25), 
        address VARCHAR(255), 
        bio VARCHAR(400), 
        is_admin BOOLEAN NOT NULL, 
        is_suspended BOOLEAN NOT NULL, 
        is_verified BOOLEAN NOT NULL, 
        failed_login_attempts INTEGER NOT NULL, 
        lockout_until DATETIME, 
        totp_secret VARCHAR(32), 
        is_2fa_enabled BOOLEAN NOT NULL, 
        two_factor_backup_codes TEXT, 
        oauth_provider VARCHAR(20), 
        oauth_id VARCHAR(100), 
        created_at DATETIME NOT NULL, _is_staff BOOLEAN DEFAULT 0, 
        PRIMARY KEY (id), 
        UNIQUE (username), 
        UNIQUE (email)
);
CREATE TABLE system_setting (
        id INTEGER NOT NULL, 
        "key" VARCHAR(50) NOT NULL, 
        value TEXT, 
        description VARCHAR(255), 
        updated_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        UNIQUE ("key")
);
CREATE TABLE category (
        id INTEGER NOT NULL, 
        name VARCHAR(80) NOT NULL, 
        slug VARCHAR(80) NOT NULL, 
        description VARCHAR(300), 
        icon VARCHAR(10), 
        colour VARCHAR(20), 
        PRIMARY KEY (id), 
        UNIQUE (name), 
        UNIQUE (slug)
);
CREATE TABLE subscribers (
        id INTEGER NOT NULL, 
        email VARCHAR(120) NOT NULL, 
        subscribed_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        UNIQUE (email)
);
CREATE TABLE daily_visitor_stat (
        id INTEGER NOT NULL, 
        date DATE NOT NULL, 
        total_views INTEGER NOT NULL, 
        unique_visitors INTEGER NOT NULL, 
        desktop_views INTEGER NOT NULL, 
        mobile_views INTEGER NOT NULL, 
        tablet_views INTEGER NOT NULL, 
        bot_views INTEGER NOT NULL, 
        created_at DATETIME NOT NULL, 
        updated_at DATETIME NOT NULL, dev_views INTEGER DEFAULT 0, 
        PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ix_daily_visitor_stat_date ON daily_visitor_stat (date);
CREATE TABLE daily_path_stat (
        id INTEGER NOT NULL, 
        date DATE NOT NULL, 
        path VARCHAR(255) NOT NULL, 
        title VARCHAR(255), 
        views INTEGER NOT NULL, 
        PRIMARY KEY (id)
);
CREATE INDEX ix_daily_path_stat_date ON daily_path_stat (date);
CREATE INDEX ix_daily_path_stat_path ON daily_path_stat (path);
CREATE TABLE visitor_daily_log (
        id INTEGER NOT NULL, 
        date DATE NOT NULL, 
        visitor_hash VARCHAR(64) NOT NULL, 
        ip_masked VARCHAR(50), 
        user_agent VARCHAR(255), 
        path VARCHAR(255), 
        device_type VARCHAR(20) NOT NULL, 
        timestamp DATETIME NOT NULL, 
        PRIMARY KEY (id)
);
CREATE INDEX ix_visitor_daily_log_visitor_hash ON visitor_daily_log (visitor_hash);
CREATE INDEX ix_visitor_daily_log_date ON visitor_daily_log (date);
CREATE TABLE engineer (
        id INTEGER NOT NULL, 
        name VARCHAR(120) NOT NULL, 
        slug VARCHAR(120) NOT NULL, 
        role VARCHAR(140) NOT NULL, 
        bio TEXT NOT NULL, 
        image_file VARCHAR(255) NOT NULL, 
        resume_file VARCHAR(255), 
        resume_md TEXT, 
        email VARCHAR(120), 
        github_url VARCHAR(255), 
        linkedin_url VARCHAR(255), 
        website_url VARCHAR(255), 
        tags VARCHAR(255), 
        sort_order INTEGER NOT NULL, 
        is_active BOOLEAN NOT NULL, 
        created_at DATETIME NOT NULL, 
        updated_at DATETIME NOT NULL, 
        PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ix_engineer_slug ON engineer (slug);
CREATE TABLE daily_analytics_summary (
        id INTEGER NOT NULL, 
        summary_date DATE NOT NULL, 
        total_page_views INTEGER NOT NULL, 
        unique_visitors INTEGER NOT NULL, 
        registered_signups INTEGER NOT NULL, 
        premium_conversions INTEGER NOT NULL, 
        estimated_ad_revenue FLOAT NOT NULL, 
        actual_stripe_revenue FLOAT NOT NULL, 
        created_at DATETIME NOT NULL, 
        updated_at DATETIME NOT NULL, 
        PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ix_daily_analytics_summary_summary_date ON daily_analytics_summary (summary_date);
CREATE TABLE login_log (
        id INTEGER NOT NULL, 
        user_id INTEGER, 
        username VARCHAR(80), 
        ip_address VARCHAR(45), 
        user_agent VARCHAR(255), 
        status VARCHAR(20) NOT NULL, 
        timestamp DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE cms_page (
        id INTEGER NOT NULL, 
        title VARCHAR(120) NOT NULL, 
        slug VARCHAR(120) NOT NULL, 
        content TEXT NOT NULL, 
        featured_image VARCHAR(255), 
        seo_title VARCHAR(160), 
        seo_description VARCHAR(320), 
        keywords VARCHAR(255), 
        is_published BOOLEAN NOT NULL, 
        publish_date DATETIME, 
        author_id INTEGER, 
        created_at DATETIME NOT NULL, 
        updated_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        UNIQUE (slug), 
        FOREIGN KEY(author_id) REFERENCES user (id)
);
CREATE TABLE uploaded_file (
        id INTEGER NOT NULL, 
        filename VARCHAR(255) NOT NULL, 
        file_path VARCHAR(255) NOT NULL, 
        file_size INTEGER NOT NULL, 
        mime_type VARCHAR(80), 
        user_id INTEGER, 
        uploaded_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE post (
        id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
        title VARCHAR(100) NOT NULL, 
        slug VARCHAR(120), 
        excerpt VARCHAR(300), 
        content TEXT NOT NULL, 
        tags VARCHAR(200), 
        date_posted DATETIME NOT NULL, 
        user_id INTEGER, 
        category VARCHAR(60), 
        image_file VARCHAR(255), 
        image_is_code BOOLEAN NOT NULL, 
        views INTEGER NOT NULL, 
        likes_count INTEGER NOT NULL, 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE UNIQUE INDEX ix_post_slug ON post (slug);
CREATE TABLE contact_message (
        id INTEGER NOT NULL, 
        name VARCHAR(120) NOT NULL, 
        email VARCHAR(120) NOT NULL, 
        phone VARCHAR(30), 
        subject VARCHAR(60) NOT NULL, 
        message TEXT NOT NULL, 
        date_sent DATETIME NOT NULL, 
        is_read BOOLEAN NOT NULL, 
        is_replied BOOLEAN NOT NULL, 
        replied_at DATETIME, 
        is_archived BOOLEAN NOT NULL, 
        user_id INTEGER, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE quiz_attempt (
        id INTEGER NOT NULL, 
        topic VARCHAR(30) NOT NULL, 
        total INTEGER NOT NULL, 
        correct INTEGER NOT NULL, 
        wrong INTEGER NOT NULL, 
        skipped INTEGER NOT NULL, 
        score_pct INTEGER NOT NULL, 
        date_taken DATETIME NOT NULL, 
        user_name VARCHAR(120), 
        user_email VARCHAR(120), 
        details_json TEXT, 
        email_sent BOOLEAN NOT NULL, 
        user_id INTEGER, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE quiz_question (
        id INTEGER NOT NULL, 
        topic VARCHAR(30) NOT NULL, 
        question TEXT NOT NULL, 
        opt_a VARCHAR(400) NOT NULL, 
        opt_b VARCHAR(400) NOT NULL, 
        opt_c VARCHAR(400) NOT NULL, 
        opt_d VARCHAR(400) NOT NULL, 
        correct_ans INTEGER NOT NULL, 
        explanation TEXT, 
        is_active BOOLEAN NOT NULL, 
        sort_order INTEGER NOT NULL, 
        created_at DATETIME NOT NULL, 
        updated_at DATETIME NOT NULL, 
        created_by INTEGER, 
        PRIMARY KEY (id), 
        FOREIGN KEY(created_by) REFERENCES user (id)
);
CREATE TABLE page_views (
        id INTEGER NOT NULL, 
        path VARCHAR(500) NOT NULL, 
        module_name VARCHAR(100), 
        visitor_hash VARCHAR(64) NOT NULL, 
        user_id INTEGER, 
        referrer VARCHAR(500), 
        user_agent VARCHAR(500), 
        device_type VARCHAR(30), 
        created_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE INDEX ix_page_views_visitor_hash ON page_views (visitor_hash);
CREATE INDEX ix_page_views_module_name ON page_views (module_name);
CREATE INDEX ix_page_views_path ON page_views (path);
CREATE INDEX ix_page_views_created_at ON page_views (created_at);
CREATE TABLE comment (
        id INTEGER NOT NULL, 
        body TEXT NOT NULL, 
        date_posted DATETIME NOT NULL, 
        post_id INTEGER NOT NULL, 
        user_id INTEGER, 
        guest_name VARCHAR(80), 
        guest_email VARCHAR(120), 
        PRIMARY KEY (id), 
        FOREIGN KEY(post_id) REFERENCES post (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE post_like (
        id INTEGER NOT NULL, 
        post_id INTEGER NOT NULL, 
        user_id INTEGER NOT NULL, 
        PRIMARY KEY (id), 
        CONSTRAINT unique_post_like UNIQUE (post_id, user_id), 
        FOREIGN KEY(post_id) REFERENCES post (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE audit_log (
        id INTEGER NOT NULL, 
        user_id INTEGER, 
        username VARCHAR(80), 
        event VARCHAR(50) NOT NULL, 
        ip_address VARCHAR(45), 
        user_agent VARCHAR(255), 
        created_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE TABLE user_sessions (
        id INTEGER NOT NULL, 
        user_id INTEGER NOT NULL, 
        session_token VARCHAR(64) NOT NULL, 
        device_name VARCHAR(100) NOT NULL, 
        ip_address VARCHAR(45) NOT NULL, 
        user_agent VARCHAR(255), 
        is_active BOOLEAN NOT NULL, 
        created_at DATETIME NOT NULL, 
        last_activity DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE UNIQUE INDEX ix_user_sessions_session_token ON user_sessions (session_token);
CREATE TABLE webauthn_credentials (
        id INTEGER NOT NULL, 
        user_id INTEGER NOT NULL, 
        credential_id VARCHAR(255) NOT NULL, 
        public_key TEXT NOT NULL, 
        sign_count INTEGER NOT NULL, 
        transports VARCHAR(255), 
        created_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE UNIQUE INDEX ix_webauthn_credentials_credential_id ON webauthn_credentials (credential_id);
CREATE TABLE page_stat (
        id INTEGER NOT NULL, 
        path VARCHAR(255) NOT NULL, 
        title VARCHAR(255) NOT NULL, 
        category VARCHAR(50) NOT NULL, 
        views_count INTEGER NOT NULL, 
        dev_views_count INTEGER NOT NULL, 
        likes_count INTEGER NOT NULL, 
        created_at DATETIME NOT NULL, 
        updated_at DATETIME NOT NULL, 
        PRIMARY KEY (id)
);
CREATE UNIQUE INDEX ix_page_stat_path ON page_stat (path);
CREATE TABLE page_like (
        id INTEGER NOT NULL, 
        path VARCHAR(255) NOT NULL, 
        user_id INTEGER, 
        visitor_hash VARCHAR(64) NOT NULL, 
        created_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (id)
);
CREATE INDEX ix_page_like_path ON page_like (path);
CREATE INDEX ix_page_like_user_id ON page_like (user_id);
CREATE INDEX ix_page_like_visitor_hash ON page_like (visitor_hash);
CREATE TABLE framework_rating (
        id INTEGER NOT NULL, 
        framework VARCHAR(50) NOT NULL, 
        rating INTEGER NOT NULL, 
        feedback TEXT, 
        user_id INTEGER, 
        visitor_hash VARCHAR(64), 
        created_at DATETIME NOT NULL, 
        PRIMARY KEY (id), 
        FOREIGN KEY(user_id) REFERENCES user (git check id)
);
CREATE INDEX ix_framework_rating_framework ON framework_rating (framework);
CREATE INDEX ix_framework_rating_visitor_hash ON framework_rating (visitor_hash);
CREATE INDEX ix_framework_rating_user_id ON framework_rating (user_id);