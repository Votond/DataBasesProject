USE [school];
GO

-- Views creation
CREATE VIEW [LessonView] AS 
	SELECT [Lessons.id] AS [LessonId], [Lessons.start_time] AS [StartTime], [Lessons.end_time] AS [EndTime], [Teachers.first_name] AS [TeacherFirstName], [Teachers.last_name] AS [TeacherLastName], [Subjects.name] AS [SubjectName] 
	FROM [Lessons], [Subjects], [Teachers]
	WHERE [Lessons.teacher_id] = [Teachers.id] AND [Lessons.subject_id] = [Subjects.Id];
GO

CREATE VIEW [ClassView] AS
	SELECT [Classes.id] AS [ClassId], [Classes.name] AS [ClassName], [Teachers.first_name] AS [TeacherFirstName], [Teachers.last_name] AS [TeacherLastName] 
	FROM [Classes], [Teachers]
	WHERE [Classes.teacher_id] = [Teachers.id];
GO

CREATE VIEW [PupilView] AS
	SELECT [Pupils.id] AS [PupilId], [Pupils.first_name] AS [PupilFirstName], [Pupils.last_name] AS [PupilLastName], [Pupils.age] AS [PupilAge], [Classes.name] AS [ClassName], [Lessons.id] AS [CurrentLessonId], [Teachers.first_name] AS [TeacherFirstName], [Teachers.last_name] AS [TeacherLastName]
	FROM [Pupils], [Classes], [Teachers], [Lessons]
	WHERE [Pupils.class_id] = [Classes.id] AND [Teachers.id] = [Classes.teacher_id] AND [Lessons.id = [Pupils.current_lesson_id];
GO

-- Procedures creation
CREATE PROCEDURE [StudyingPupilsSummary] AS
	SELECT * FROM [PupilView] WHERE [PupilView.CurrentLessonId] IS NOT NULL;
GO

-- Functions creation
CREATE FUNCTION [GetSalaryByTeacherId] (@id INT)
	RETURNS INT
	AS
	BEGIN
		DECLARE @salary INT;
		SELECT @salary = [salary] FROM [Teachers] WHERE [id] = @id;
		RETURN(@salary);
	END;
GO

-- Triggers creation
CREATE TRIGGER [MaxClassesLimitation]
	ON [Classes]
	AFTER INSERT AS
	DELETE FROM [Classes] WHERE [id] = (
		SELECT [id] FROM [Classes] ORDER BY [id] OFFSET 10 ROWS
	);
GO