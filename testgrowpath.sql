CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20),
    profile_picture VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE career_paths (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(100),
    difficulty_level VARCHAR(50),
    estimated_duration_months INT,
    created_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE skill_courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    description TEXT,
    level VARCHAR(50),
    duration_hours INT,
    url VARCHAR(255),
    created_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE career_path_skills (
    id SERIAL PRIMARY KEY,
    career_path_id INT REFERENCES career_paths(id) ON DELETE CASCADE,
    skill_course_id INT REFERENCES skill_courses(id) ON DELETE CASCADE,
    is_mandatory BOOLEAN DEFAULT false
);

CREATE TABLE assessment_questions (
    id SERIAL PRIMARY KEY,
    question_text TEXT NOT NULL,
    question_type VARCHAR(50),
    category VARCHAR(100),
    created_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE assessment_options (
    id SERIAL PRIMARY KEY,
    question_id INT REFERENCES assessment_questions(id) ON DELETE CASCADE,
    option_text VARCHAR(255),
    score INT,
    career_path_id INT REFERENCES career_paths(id)
);

CREATE TABLE user_assessment_sessions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    recommended_career_path_id INT REFERENCES career_paths(id),
    total_score INT,
    started_at TIMESTAMP,
    completed_at TIMESTAMP
);

CREATE TABLE user_assessment_answers (
    id SERIAL PRIMARY KEY,
    session_id INT REFERENCES user_assessment_sessions(id) ON DELETE CASCADE,
    question_id INT REFERENCES assessment_questions(id),
    option_id INT REFERENCES assessment_options(id),
    answer_score INT
);

CREATE TABLE roadmaps (
    id SERIAL PRIMARY KEY,
    career_path_id INT REFERENCES career_paths(id),
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE roadmap_contents (
    id SERIAL PRIMARY KEY,
    roadmap_id INT REFERENCES roadmaps(id) ON DELETE CASCADE,
    title VARCHAR(100),
    description TEXT,
    step_order INT,
    skill_course_id INT REFERENCES skill_courses(id),
    estimated_days INT
);

CREATE TABLE user_progress (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    roadmap_content_id INT REFERENCES roadmap_contents(id),
    skill_course_id INT REFERENCES skill_courses(id),
    status VARCHAR(50),
    progress_percent DECIMAL(5,2),
    started_at TIMESTAMP,
    completed_at TIMESTAMP
);

CREATE TABLE bookmarks (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    career_path_id INT REFERENCES career_paths(id),
    roadmap_id INT REFERENCES roadmaps(id),
    skill_course_id INT REFERENCES skill_courses(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);