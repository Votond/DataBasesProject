USE [school]
GO

CREATE TABLE [Teachers](
	[id] INT NOT NULL IDENTITY (1, 1),
	[first_name] VARCHAR(50) NOT NULL,
	[last_name] VARCHAR(50) NOT NULL,
	[salary] FLOAT NOT NULL CONSTRAINT [DF_Teacher_Salary] DEFAULT 100,
	
	[age] TINYINT NULL 
		CONSTRAINT [CK_Teacher_Age] CHECK([age] >= 18)
		CONSTRAINT [DF_Teacher_Age] DEFAULT 18,
		
	CONSTRAINT [PK_Teacher_Id] PRIMARY KEY ([id])
);
 
CREATE TABLE [Subjects](
	[id] INT NOT NULL IDENTITY (1, 1),
	[name] VARCHAR(100) NOT NULL,
	
	CONSTRAINT [PK_Subject_Id] PRIMARY KEY ([id])
);
 
CREATE TABLE [Classes](
	[id] INT NOT NULL IDENTITY (1, 1),
	[name] VARCHAR(10) NOT NULL,
	[teacher_id] INT NOT NULL,
	
	CONSTRAINT [PK_Class_Id] PRIMARY KEY ([id]),
	CONSTRAINT [FK_Classes_Teachers] FOREIGN KEY ([teacher_id]) REFERENCES [Teachers]([id])
);
 
CREATE TABLE [Lessons](
	[id] INT NOT NULL IDENTITY (1, 1),
	[teacher_id] INT NOT NULL,
	[subject_id] INT NOT NULL,
	
	[start_time] TIME NOT NULL
		CONSTRAINT [DF_Lesson_StartTime] DEFAULT CONVERT(TIME(0), GETDATE(), 108),
		
	[end_time] TIME NOT NULL
		CONSTRAINT [DF_Lesson_EndTime] DEFAULT DATEADD(minute, 40, 
			CONVERT(TIME(0), GETDATE(), 108)
		),
	
	CONSTRAINT [PK_Lesson_Id] PRIMARY KEY ([id]),
	CONSTRAINT [FK_Lessons_Teachers] FOREIGN KEY ([teacher_id]) REFERENCES [Teachers]([id]),
	CONSTRAINT [FK_Lessons_Subjects] FOREIGN KEY ([subject_id]) REFERENCES [Subjects]([id])
);
 
CREATE TABLE [Pupils](
	[id] INT NOT NULL IDENTITY (1, 1),
	[first_name] VARCHAR(50) NOT NULL,
	[last_name] VARCHAR(50) NOT NULL,
	[class_id] INT NOT NULL,
	[current_lesson_id] INT NULL,
	
	[age] TINYINT NULL,
		
	CONSTRAINT [PK_Pupil_Id] PRIMARY KEY ([id]),
	CONSTRAINT [FK_Pupils_Classes] FOREIGN KEY ([class_id]) REFERENCES [Classes]([id]),
	CONSTRAINT [FK_Pupils_Lessons] FOREIGN KEY ([current_lesson_id]) REFERENCES [Lessons]([id])
);