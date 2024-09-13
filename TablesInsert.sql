USE [school];
GO

-- Subjects insert
INSERT INTO [dbo].[Subjects]([name])
     VALUES
           ('Maths');

INSERT INTO [dbo].[Subjects]([name])
     VALUES
           ('Physics');
GO

-- Teachers insert
INSERT INTO [dbo].[Teachers]([first_name], [last_name], [salary], [age])
     VALUES
           (
		   'Jill',
		   'Guzman',
		   125,
		   26
);

INSERT INTO [dbo].[Teachers]([first_name], [last_name], [salary], [age])
     VALUES
           (
		   'Frances',
		   'Jordan',
		   140,
		   31
);
GO

-- Lessons insert
INSERT INTO [dbo].[Lessons]([teacher_id], [subject_id])
     VALUES
           (
		   1,
		   2
);

INSERT INTO [dbo].[Lessons]([teacher_id], [subject_id])
     VALUES
           (
		   2,
		   1
);
GO

-- Classes insert
INSERT INTO [dbo].[Classes]([name], [teacher_id])
     VALUES
		   (
		   '9 B',
		   1
);

INSERT INTO [dbo].[Classes]([name], [teacher_id])
     VALUES
		   (
		   '10 A',
		   2
);
GO

-- Pupils insert
INSERT INTO [dbo].[Pupils]([first_name], [last_name], [age], [class_id], [current_lesson_id])
     VALUES
           (
		   'Frank',
		   'Knight',
		   15,
		   1,
		   1
		   );

INSERT INTO [dbo].[Pupils]([first_name], [last_name], [age], [class_id], [current_lesson_id])
     VALUES
           (
		   'Tina',
		   'Lee',
		   15,
		   1,
		   1
		   );

INSERT INTO [dbo].[Pupils]([first_name], [last_name], [age], [class_id], [current_lesson_id])
     VALUES
           (
		   'Matthew',
		   'Brooks',
		   15,
		   1,
		   1
		   );

INSERT INTO [dbo].[Pupils]([first_name], [last_name], [age], [class_id], [current_lesson_id])
     VALUES
           (
		   'Loretta',
		   'Taylor',
		   16,
		   2,
		   2
		   );

INSERT INTO [dbo].[Pupils]([first_name], [last_name], [age], [class_id], [current_lesson_id])
     VALUES
           (
		   'Joel',
		   'Thomas',
		   16,
		   2,
		   2
		   );

INSERT INTO [dbo].[Pupils]([first_name], [last_name], [age], [class_id], [current_lesson_id])
     VALUES
           (
		   'Melissa',
		   'Reed',
		   16,
		   2,
		   2
		   );
