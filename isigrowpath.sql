insert into users (full_name, email, password_hash, role)
values
('admin growpath', 'admin@growpath.com', 'hashedpassword', 'admin'),
('reza fahresi', 'reza@gmail.com', 'hashedpassword', 'user');

insert into career_paths (title, description, category, difficulty_level, estimated_duration_months, created_by)
values
('backend developer', 'fokus pada server-side development', 'programming', 'intermediate', 6, 1),
('frontend developer', 'fokus pada ui/ux web', 'programming', 'beginner', 5, 1);

insert into skill_courses (title, type, description, level, duration_hours, url, created_by)
values
('node.js basic', 'video', 'belajar dasar node.js', 'beginner', 10, 'https://example.com/node', 1),
('express.js api', 'video', 'membuat rest api', 'intermediate', 12, 'https://example.com/express', 1),
('react.js basic', 'video', 'belajar react dasar', 'beginner', 15, 'https://example.com/react', 1);

insert into career_path_skills (career_path_id, skill_course_id, is_mandatory)
values
(1, 1, true),
(1, 2, true),
(2, 3, true);

insert into assessment_questions (question_text, question_type, category, created_by)
values
('kamu lebih suka bekerja di bagian mana?', 'multiple_choice', 'interest', 1),
('seberapa nyaman kamu dengan coding?', 'multiple_choice', 'skill', 1);

insert into assessment_options (question_id, option_text, score, career_path_id)
values
(1, 'backend (server, database)', 10, 1),
(1, 'frontend (ui, tampilan)', 10, 2),
(2, 'sangat nyaman', 10, 1),
(2, 'masih belajar', 5, 2);

insert into user_assessment_sessions (user_id, recommended_career_path_id, total_score, started_at, completed_at)
values
(2, 1, 20, now(), now());

insert into user_assessment_answers (session_id, question_id, option_id, answer_score)
values
(1, 1, 1, 10),
(1, 2, 3, 10);

insert into roadmaps (career_path_id, title, description, created_by)
values
(1, 'backend roadmap', 'roadmap untuk backend developer', 1),
(2, 'frontend roadmap', 'roadmap untuk frontend developer', 1);

insert into roadmap_contents (roadmap_id, title, description, step_order, skill_course_id, estimated_days)
values
(1, 'belajar node.js', 'dasar node.js', 1, 1, 7),
(1, 'belajar express', 'membuat api', 2, 2, 10),
(2, 'belajar react', 'dasar react', 1, 3, 10);

insert into user_progress (user_id, roadmap_content_id, skill_course_id, status, progress_percent, started_at)
values
(2, 1, 1, 'in_progress', 50, now()),
(2, 2, 2, 'not_started', 0, null);

insert into bookmarks (user_id, career_path_id, roadmap_id, skill_course_id)
values
(2, 1, 1, 1),
(2, 2, 2, 3);