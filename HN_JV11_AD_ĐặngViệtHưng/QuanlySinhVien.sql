create database Test2;
use Test2;
-- tao bang Students
create table Students(
StudentID int not null primary key,
StudentName varchar(50),
Age int,
Email varchar(100)
);

-- tao bang Classes
create table Classes(
ClassID int not null primary key,
ClassName varchar(50)
);

-- tao bang classStudent
create table ClassStudent(
StudentID int, foreign key (StudentID)references Students(StudentID),
ClassID int, foreign key (ClassID) references Classes(ClassID)
);

-- tao bang Subjects
create table Subjects(
SubjectID int not null primary key,
SubjectName varchar(50)
);

-- tao bang Marks
create table Marks(
Mark int,
SubjectID int, foreign key(SubjectID) references Subjects(SubjectID),
StudentID int, foreign key(StudentID) references Students(StudentID)
);

-- them du lieu vao bang students
insert into Students(StudentID, StudentName,Age,Email) values
(1,"Nguyen Quang An",18,"an@yahoo.com"),
(2,"Nguyen Cong Vinh",20,"vinh@yahoo.com"),
(3,"Nguyen Van Quyen",19,"quyen"),
(4,"Pham Thanh Binh",25,"binh@com"),
(5,"Nguyen Van Tai Em",30,"taiem@sport.vn");

-- them du lieu vao bang Classes
insert into Classes(ClassID, ClassName) values
(1,"C0706L"),
(2,"C0708G");

-- them du lieu vao bang classStudent
insert into ClassStudent(StudentID,ClassID) values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2);

-- them du lieu vao bang Subjects
insert into Subjects(SubjectID, SubjectName) values
(1,"SQL"),
(2,"JAVA"),
(3,"C"),
(4,"Visual Basic");

-- them du lieu vao bang Marks
insert into Marks(Mark,SubjectID,StudentID) values
(8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(8,3,3),
(1,3,5),
(3,2,4);


-- Lenh truy van
-- 1. Hien thi danh sach tat ca cac hoc vien 
Select * from Students;
-- 2. Hien thi danh sach tat ca cac mon hoc
select * from Subjects;
-- 3. Tinh diem trung binh 
select avg(mark) from marks;
-- 4. Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select SubjectName,mark from subjects join marks on subjects.SubjectId = marks.subjectID where mark=(select max(mark) from marks);
-- 5. Danh so thu tu cua diem theo chieu giam
(select mark from marks order by mark desc);
-- 6. Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
alter table Subjects
modify SubjectName nvarchar(250) ;
-- 7. Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
update subjects set SubjectName = concat("Day la mon hoc",SubjectName);
-- 8. Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table students
add constraint check_age check(Age> 15 and age<50);
-- 9. Loai bo tat ca quan he giua cac bang
alter table classstudent drop constraint classstudent_ibfk_1;
alter table classstudent drop constraint classstudent_ibfk_2;
alter table marks drop constraint marks_ibfk_1;
alter table marks drop constraint marks_ibfk_2;
-- 10.Xoa hoc vien co StudentID la 1
delete from Students where studentID = 1;
-- 11.Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table Students
add column `Status` Bit default 1;
-- 12.Cap nhap gia tri Status trong bang Student thanh 0
update students set `status` = 0;
