Create database QLNS;

go
	use QLNS;

go
	Create table Banner(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Images nvarchar(150) not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Blog(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Description ntext not null,
		Images nvarchar(150) not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Account(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Email nvarchar(150) not null,
		Phone nvarchar(150) not null,
		Password nvarchar(50) not null,
		Address nvarchar(150) not null,
		Birthday nvarchar(150) not null,
		Gender bit default 1,
		Images nvarchar(150) null,
		Role bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Category(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Description ntext not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Product(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Price float not null,
		SalePrice float default 0,
		Images nvarchar(150) not null,
		CategoryID int foreign key references Category(ID) not null,
		Description ntext not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Orders(
		ID int identity primary key,
		Code nvarchar(50) not null,
		Name nvarchar(150) not null,
		Email varchar(150) not null,
		Phone varchar(150) not null,
		Address nvarchar(150) not null,
		TotalQuantity int,
		TotalPrice float,
		Status bit default 1,
		AccountID int foreign key references Account(ID),
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table OrderDetail(
		ID int identity primary key,
		ProductID int foreign key references Product(ID) not null,
		OrderID int foreign key references Orders(ID) not null,
		Price float NOT NULL,
		Quantity int not null,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Favorite(
		ID int identity primary key,
		ProductID int foreign key references Product(ID) not null,
		AccountID int foreign key references Account(ID) not null,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

go
	Create table Rating(
		ID int identity primary key,
		ProductID int foreign key references Product(ID) not null,
		AccountID int foreign key references Account(ID) not null,
		Star float not null,
		Description ntext not null,
		Status bit default 1,
		CreatedDate date DEFAULT GETDATE(),
		ModiredDate date DEFAULT GETDATE()
	);

GO
INSERT INTO
	Category (Code, Name, Description)
values
(
		N 'NK342',
		N'Trái cây nhập khẩu',
		N'Trái cây được nhập khẩu từ các nước khác nhau'
	);

INSERT INTO
	Category (Code, Name, Description)
values
(
		N 'TN236',
		N'Trái cây trong nước',
		N'Trái cây đặc sản của các vùng miền trong nước'
	);

INSERT INTO
	Category (Code, Name, Description)
values
(
		N'GQ872',
		N'Giỏ quà',
		N'Trái cây hoặc đồ khô được đóng thành giỏ'
	);

INSERT INTO
	Category (Code, Name, Description)
values
(
		N'TP895',
		N'Thực phẩm',
		N'Thực phẩm ăn uống hàng ngày'
	);

INSERT INTO
	Category (Code, Name, Description)
values
(
		N'ĐK357',
		N'Đồ khô',
		N'Thực phẩm khô và các loại hạt'
	);

Go
INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00001',
		N 'Nho Đen Nam Phi',
		100000,
		N'nhodennamphi1.jpg',
		1,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00002',
		N 'Nho Úc Sweetglobe',
		175000,
		N'nhoxanhuc1.jpg',
		1,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00003',
		N'Quýt Baby Đài Loan',
		75000,
		N'quytbabydailoan1.jpg',
		1,
		N'Mỏng vỏ, thơm, tươi, ngọt đậm. 1kg khoảng 8-9 quả'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00005',
		N'Dưa Lưới Đài Loan',
		160000,
		N'dualuoidailoan1.jpg',
		1,
		N'Ruột cam, ngọt lịm, thơm, thanh mát  '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00006',
		N 'Nho xanh Nam Phi',
		155000,
		N'nhoxanhnamphi1.png',
		1,
		N ' Nho có dáng thuôn, vỏ mỏng, màu xanh hổ phách bắt mắt. Thịt nho giòn tan, không hạt, vị ngọt đậm đà rất ngon. '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00007',
		N'Hồng Xiêm Xuân Đỉnh',
		45000,
		N'hongxiemxuandinh1.png',
		2,
		N 'Hồng xiêm Xuân Đỉnh có hương thơm và vị ngọt rất đặc biệt. Những miếng hồng xiêm khi cắt màu mật ong óng ả,thịt hồng mịn'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00008',
		N'Bơ Sáp Quốc Minh',
		75000,
		N'bosapquocminh1.jpg',
		2,
		N'Cơm bơ: vàng màu mỡ gà, dẻo và béo dừng ở mức độ vừa phải, thích hợp cho ăn sống hoặc xay sinh tố, ăn salad '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00009',
		N 'Ổi Nữ Hoàng',
		30000,
		N'oinuhoang1.jpg',
		2,
		N 'Ổi nữ hoàng quả to, xanh, giòn, ăn vào có vị chua ngọt, hạt rất ít. Một đĩa Ổi Nữ Hoàng kèm chèn muối ớt cay nồng sẽ là sự kết hợp hoàn hảo cho bữa ăn vặt thơm ngon, tốt cho sức khỏe. '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00010',
		N'Xoài Keo',
		28000,
		N'xoaikeo1.png',
		2,
		N'Loại trái cây phổ biến được ưa chuộng giàu chất xơ, vitamin, khoáng chất thiết yếu giúp cung cấp chất dinh dưỡng cho cơ thể con người và mang lại nhiều lợi ích tuyệt vời cho hệ tiêu hóa, tim mạch, giúp mắt sáng, làm đẹp da. Xoài keo có quả chắc giòn giòn chua ngọt thơm ngon được nhiều người ưa thích '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00011',
		N'Vú Sữa Tím',
		45000,
		N'vusuatim1.jpg',
		2,
		N'Không chỉ thơm và ngọt, vú sữa có nhiều công dụng đối với sức khỏe  '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00012',
		N'Vải Thiều Thanh Hà',
		30000,
		N'vaithieuthanhha1.jpg',
		2,
		N'Thịt nhiều, cùi dầy, hạt nhỏ,mùi thơm đặc trưng, khi ăn bạn sẽ cảm nhận được vị ngọt, thanh mát. '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00013',
		N'Bưởi Da Xanh',
		80000,
		N'buoidaxanh1.jpg',
		2,
		N' chắc quả, vỏ thì lại mỏng,hạt thì rất ít '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00014',
		N'Cam Sành Tiền Giang',
		50000,
		N'camsanhtiengiang1.png',
		2,
		N'Vỏ cam sành màu xanh đến xanh vàng khi chín, sần và dầy 3-5mm, tép màu vàng cam đậm, nhiều nước, vị ngọt chua mùi rất thơm và khá nhiều hạt '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00015',
		N'Chôm chôm nhãn',
		175000,
		N'nhoxanhuc1.jpg',
		2,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00016',
		N'Giỏ trái cây GR10',
		550000,
		N'giotraicay1.jpg',
		3,
		N '2 cam mỹ/Úc Premier
2 quýt Úc S36
1 Lê Hàn quốc premium
1 kiwi vàng
0.5 kg nho xanh/đen/đỏ Mỹ/Úc/Nam Phi
1 táo xanh Mỹ/Pháp
giỏ mây
nơ và vật dụng trang trí '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00017',
		N'Giỏ trái cây GQTC1',
		1540000,
		N'giotraicay2.jpg',
		3,
		N 'Nho xanh nhập khẩu 1kg (Mỹ, Úc, Nam Phi)
Nho đỏ/kẹo/đen nhập khẩu 1kg (Mỹ, Úc, Nam Phi)
2 kiwi vàng New Zealand/Pháp
4 táo Envy
3 lê Nam Phi
3 lê Hàn Quốc Premier
3 cam vàng Úc Premier
giỏ mây cao cấp
nơ và vật dụng trang trí '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00018',
		N'Giỏ trái cây GQTC21',
		750000,
		N'giotraicay3.jpg',
		3,
		N '1 lê Hàn Quốc Premier
8 táo gala Mỹ S90 (hoặc tương đương)
0.5kg nho xanh/đỏ/đen Mỹ
2 cam vàng Úc Premier
3 lê Nam Phi
2 Quýt Úc
giỏ cạp L
nơ và vật dụng trang trí '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00019',
		N'Hộp trái cây HT4',
		490000,
		N'hoptraicay1.jpg',
		3,
		N ' Táo queen, Breeze NZ hoặc tương đương
Nho xanh Mỹ/nho đen Mỹ
Cam Úc
Lê Hàn Quốc Premier
Kiwi xanh hoặc tương đương
Hộp quà in giấy mỹ thuật thơm
Nơ và vật dụng trang trí'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00019',
		N'Hộp trái cây HQTC4',
		1600000,
		N'hoptraicay2.jpg',
		3,
		N 'Dâu tây Hàn Quốc 700gr loại 1
Nho xanh Mỹ/Úc/Nam Phi 2kg
Hoa trang trí
1 cành hồng đẹp thơm
hộp quà in giấy mỹ thuật thơm
nơ và vật dụng trang trí'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00020',
		N'Miến Gogi Hàn Quốc',
		850000,
		N'miengogihanquoc1.jpg',
		5,
		N'Miến khoai lang Gogi - Hàn Quốc 1kg'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00021',
		N'Bột Cacao Choco Quick Kruger Hộp 800G',
		135000,
		N'botcacao1.png',
		5,
		N'ột ca cao pha sữa trẻ em Choco Quick Kkhông chứa chất tạo màu, tạo vị và chất làm ngọt nhân tạo,là bột sô cô la hoà tan, bổ sung chất xơ, tăng hấp thụ Calcium, hổ trợ tiêu hoá.'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00022',
		N 'Ruốc Cá Hồi Soboro 160g Nhật Bản',
		95000,
		N'ruoccahoi.jpg',
		5,
		N'Ruốc cá hồi là thực phẩm rất giàu omega 3 – DHA, có hàm lượng dinh dưỡng cao cũng như hương vị thơm ngon, rất tốt cho sự phát triển của trẻ và đặc biệt tốt cho não bộ.'
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00023',
		N 'Dầu Ăn Hạt Cải Nhật Bản',
		78000,
		N'dauanhatcai1.jpg',
		5,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00024',
		N'Sữa Kid Essentials Úc 800g',
		570000,
		N'sua1.jpg',
		5,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00025',
		N'Sữa Devondale 1Kg Úc',
		260000,
		N'sua2.jpg',
		5,
		N' '
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00026',
		N 'Kiwi Vàng Newzealand 500g',
		110000,
		N'kiwivang1.jpg',
		1,
		N''
	);

INSERT INTO
	Product (Code, Name, Price, Images, CategoryID, Description)
values
(
		N'00027',
		N 'Kiwi Xanh Newzealand 500g',
		190000,
		N'kiwixanh1.jpg',
		1,
		N''
	);

Go
INSERT INTO
	Banner (Code, Name, Images)
values
(
		N'00001',
		N'Thực phẩm hữu cơ ngon và tốt cho sức khỏe',
		N'banner1.png'
	);

INSERT INTO
	Banner (Code, Name, Images)
values
(
		N'00002',
		N'Món ăn yêu thích nhất của Vườn chúng tôi',
		N'banner2.png'
	);

go
INSERT INTO
	Account(
		Code,
		Name,
		Email,
		Phone,
		Password,
		Address,
		Birthday,
		Gender,
		Images,
		Role
	)
VALUES
	(
		N'00001',
		N'Hoàng Thụy',
		'thuyhoang@gmail.com',
		'0912384756',
		'123456789',
		N'Hải Phòng',
		'1978-02-21',
		0,
		'',
		1
	),
	(
		N'00002',
		N'Lại Hải Lâm',
		'lam345@gmail.com',
		'0987258445',
		'123456789',
		N'Hải Dương',
		'1983-06-15',
		0,
		'',
		1
	),
	(
		N'00003',
		N'Phạm Diệu Huyền',
		'huyendieu@gmail.com',
		'0565798321',
		'123456789',
		N 'Bắc Ninh',
		'1989-12-06',
		1,
		'',
		1
	),
	(
		N'00004',
		N 'Nguyễn Thanh Trúc',
		'thanhtruc@gmail.com',
		'0366984656',
		'123456789',
		N'Hải Phòng',
		'1990-04-17',
		1,
		'',
		1
	),
	(
		N'00005',
		N'Hoàng Khả Hân',
		'hanhan@gmail.com',
		'0984554398',
		'123456789',
		N'Bắc Kạn',
		'1987-10-06',
		1,
		'',
		0
	),
	(
		N'00006',
		N 'Nguyễn Phúc An',
		'anphuc@gmail.com',
		'0326589398',
		'123456789',
		N 'Nghệ An',
		'1990-11-13',
		0,
		'',
		1
	),
	(
		N'00007',
		N'Phạm Gia Huy',
		'huypham332@gmail.com',
		'0563489798',
		'123456789',
		N'Thanh Hóa',
		'1990-01-11',
		0,
		'',
		1
	),
	(
		N'00008',
		N'Vũ Quốc Trường',
		'quoctruong@gmail.com',
		'024568798',
		'123456789',
		N 'Nghệ An',
		'1987-10-23',
		0,
		'',
		1
	),
	(
		N'00009',
		N'Hoàng Mạnh Bình',
		'hoangmanhbinh@gmail.com',
		'0456825398',
		'123456789',
		N'Hưng Yên',
		'1999-09-27',
		0,
		'',
		0
	),
	(
		N'00010',
		N'Trịnh Thanh Hà',
		'hathanh@gmail.com',
		'0988756398',
		'123456789',
		N 'Hà Nam',
		'1999-07-03',
		1,
		'',
		1
	);

go
INSERT INTO
	Blog (Code, Name, Description, Images)
VALUES
	(
		N'00001',
		N 'DẤU HIỆU NHẬN BIẾT HOA QUẢ NGÂM THUỐC',
		N 'Hoa quả ngâm thuốc – một vấn đề nhức nhối đang khiến cho tất cả người tiêu dùng Việt luôn vô cùng hoang mang mỗi lần mua sắm. Với mong muốn giúp những người nội trợ có thể chọn được đúng hoa quả tươi ngon cho gia đình, trong bài viết sau đây, cửa hàng hoa quả sạch Đống Đa chúng tôi sẽ tổng hợp các dấu hiệu của hoa quả ngâm thuốc, đặc biệt là những loại hoa quả Việt Nam thông dụng.

Dấu hiệu nhận biết các loại hoa quả ngâm thuốc
Chuối: Dấu hiệu nhận biết chuối chín do ngâm thuốc thường có màu vàng rộm, đều đẹp mắt. Khi chọn chuối, hãy chọn những nải chuối có vỏ màu vàng không đều, có một vài đốm thâm, cuống tươi và khi ấn vào quả có độ mềm vừa phải.

dấu hiệu nhận biết chuối ngâm thuốc


Chôm chôm: Chôm chôm ngon nhất khi chín trên cây và được hái xuống, để ăn trong vòng 2 – 3 ngày. Vì loại quả này thường chỉ được giá trong một thời gian ngắn nên sẽ có trường hợp quả bị ép chín bằng các loại thuốc ủ độc hại. Khi chọn mua chôm chôm, tuyệt đối tránh những quả có vỏ ngoài màu tối, mềm, gai quả bị héo cho dù cuống và lá còn tươi. Ngoài ra, chôm chôm ngon sẽ có cùi mà trắng đục, giòn và róc, khi tách vỏ lập tức có nước chảy ra, vì vậy, nếu chôm chôm có hiện tượng cùi ngả vang, mềm nhũn thì không nên mua.

Xoài: Xoài ngâm hóa chất thường có cuống bị héo, đen, vỏ chín màu vàng không đều và thường có những đốm đen. Khi chọn mua xoài, hãy chỉ lựa những quả xoài chín có màu vàng tươi đều, mùi thơm tinh khiết, cầm vào chắc tay, cuống còn nguyên và cứng bởi đây là những quả xoài chín tự nhiên, chưa bị ủ qua hóa chất.

Táo: Các hộ kinh doanh hoa quả sạch nhập khẩu ở Hà Nội chia sẻ rằng, những quả táo có vỏ nhiều vùng hoặc một lớp trắng mịn bên ngoài vỏ chính là táo đã bị tẩm nhiều chất bảo quản. Khi mua táo, các bạn nên chú ý kỹ vỏ táo bên trong lớp xốp để không bị mua nhầm loại không ngon sạch.

Đào: Nên tránh mua những quả đào có vỏ ngoài trơn bóng, to tròn, ấn vào quả mềm nhũn và không có mùi thơm tinh khiết của quả chín bởi đây rất có thể là đào Trung Quốc và luôn bị ngâm tẩm hóa chất. Hãy chọn mua những quả đào nhỏ, nhiều lông, đầu quả nhọn, cuống tươi, quả cứng. Loại nào này tuy có vẻ ngoài không bắt mắt nhưng sẽ rất giòn, vị chua ngọt rất dễ ăn và quan trọng nhất là không bị ngâm chất bảo quản.

Dưa lưới: Khi mua dưa lưới nên tránh mua những quả quá to, lớp lưới trên vỏ thưa, trên vỏ có những đốm nâu lạ, vì đây là dưa Trung Quốc, bị ngâm thuốc hoặc bị hỏng. Chỉ nên chọn mua những quả dưa lưới dưới 1,5kg, lớp lưới trên vỏ dày, vỏ hơi mềm và đàn hồi tốt, nếu cuống đã rụng thì trên đầu quả dưa phải có một hố lõm nông, trơn, ngoài mép hình răng cưa, có mùi thơm ngọt của hoa quả chín.

dấu hiệu nhận biết dưa lưới ngon sạch 


Mít: Mít chín cây có màu vàng tươi, khi bổ ra ít mủ, mùi thơm ngát. Chính vì vậy, khi chọn mua mít, nên tránh những quả mít gai nhỏ, sát, bổ ra có nhiều mủ trắng lỏng chảy ra, múi vàng nhạt hoặc không đều màu.

Sầu riêng: Sầu riêng ngon có mùi thơm ngát đặc trưng, gai mỏng và cuống tươi, có thể dùng tay để tách lấy cơm. Ngược lại, những quả sầu riêng có gai bị bầm dập, vỏ dày cứng, mùi không thơm thì có khả năng đã bị hái non, tiêm thuốc ép chín.

Cam: Cam bị ngâm thuốc ép chín thường có màu vàng nhạt đều khắp quả, các hố li ti chứa tinh dầu nhỏ, cuống héo, quả không được tròn căng. Khi mua nên chọn những quả cam cuống tươi, quả căng tròn, các hố chứa tinh dầu miệng giãn nở ra, quả chín vàng đậm ở đầu cuống và nhạt dần về phía đuôi quả.

Đu đủ: Đu đủ bị ngâm thuốc tuy vỏ có màu trơn, màu vàng óng nhưng khi ấn vào không mềm, bổ ra sẽ có rất nhiều nhựa. Nên chọn mua những quả đu đủ có cuống tươi, khi ấn vào có độ đàn hồi, bổ ra không có mủ và ít hạt tại những cửa hàng hoa quả sạch uy tín, được cam kết về chất lượng để có thể yên tâm nhất.

Thanh long: Thanh long có vỏ dày, gai héo, màu nhạt thì rất có thể là loại quả non bị hái sớm, tẩm thuốc. Nên chọn những quả thanh long da mỏng căng bóng, thân quả mẩy, gai tươi, màu vỏ thẫm để mua.

Bòn bon: Quả bòn bon chín chuẩn sẽ có màu sắc đậm, dưới đuôi quả có những đốm đen li ti như bị kim châm, không có mũ, hạt đen nhỏ. Ngược lại, bòn bon ngâm hóa chất sẽ có màu vàng đất nhạt và đều, da trơn bóng, hạt to màu hồng và có nhiều mủ.

dấu hiệu nhận biết bòn bon sạch


Nhãn: Nhãn bị phun thuốc bảo quản thường có hình dáng đẹp, vỏ đều màu, căng, không có lớp sần tự nhiên. Nhãn chín cây thường có mùi thơm ngọt nên các bạn cũng có thể dựa vào mùi hương để nhận biết có phải nhãn sạch chín cây hay không. Nên tránh bị thu hút bởi những quả nhãn đẹp mà chọn nhầm loại quả độc hại.

Hy vọng rằng với những chia sẻ về các dấu hiệu nhận biết hoa quả ngâm thuốc trên đây của chúng tôi sẽ giúp cho các bạn dễ dàng hơn trong việc chọn và ăn hoa quả thật sự sạch, không bị ngâm tẩm các chất hóa học.

Nếu các bạn vẫn đang tìm cho mình một cửa hàng hoa quả sạch Đống Đa Hà Nội thật sự uy tín để không còn phải lo lắng nhiều về vấn đề chất lượng hoa quả, hãy liên hệ ngay với cửa hàng hoa quả sạch Đông Dương để được phục vụ tận nơi và cam kết tuyệt đối về độ an toàn của sản phẩm.',
		N'1.jpg'
	),
	(
		N'00002',
		N 'ĂN HOA QUẢ NÀO ĐỂ PHÒNG CHỐNG DỊCH CORONA?',
		N 'Ăn hoa quả nào để phòng chống dịch Corona?
Dịch cúm do virus Corona hiện đang là đại dịch trên thế giới với con số người nhiễm bệnh lên đến hơn 20 nghìn người, với gần 400 người tử vong. Do đó, công tác phòng chống dịch cúm Corona đang được các quốc gia ráo riết thực thi. Bên cạnh các khuyến cáo của Bộ Y tế Việt Nam về việc phòng chống Corona như: Thường xuyên rửa tay bằng xà phòng, tránh tụ tập đông người, sử dụng khẩu trang khi ra ngoài hoặc tiếp xúc nơi đông người, ăn thực phẩm nấu chín,... thì việc tăng cường sức đề kháng cho cơ thể cũng là điều rất cần thiết. Khi nhắc đến sức đề kháng thì không thể không nhắc đến Vitamin C, loại Vitamin thúc đẩy hệ thống miễn dịch. Vậy nên ăn những loại hoa quả tươi nào để có nhiều Vitamin C nhất mà lại vừa dễ mua, mời các bạn cùng theo dõi bài viết sau.

Có thể bạn quan tâm: Lựa chọn và ăn hoa quả đúng cách.

1. Ổi
Có 228 gram Vitamin C mỗi 100 gram ổi. Đây là loại trái cây nhiệt đới có vị ngọt với nhiều chất xơ, vitamin A, axit folic, đồng, và nhiều vitamin C hơn bốn lần so với cam. Bạn nên ăn luôn cả vỏ khi ăn ổi, vì chúng cũng chứa một nguồn vitamin dồi dào.

2. Kiwi
Có 90 gram Vitamin C mỗi 100 gram kiwi. Kiwi là loại quả có vị ngọt nhẹ, hương thơm mát dễ chịu và rất giàu vitamin C, và cũng có nhiều kali hơn chuối. Người ta thường thái lát kiwi để làm món salad trái cây, có thể kết hợp với dâu tây.

3. Dâu tây
Có 60 gram của Vitamin C mỗi 100 gram dâu tây. Đây là một món ăn ngon giàu Vitamin C, thậm chí nhiều hơn cho mỗi gram của quả cam. Dâu tây có thể ăn tươi hoặc làm salad, xay sinh tố đều rất ngon mà lại bổ dưỡng.

4. Cam
Có 50 gram Vitamin C mỗi 100 gram cam. Tại sao khi nghe và nhìn thấy quả này điều chúng ta nghĩ đến đầu tiên là nó rất giàu vitamin C? Họ nhà cam quýt không những rất giàu vitamin C, mà chúng rất ngon. Các nhà khoa học cũng chỉ ra rằng mùi hương cam làm cho mọi người cảm thấy dễ chịu và vui vẻ hơn.

Hy vọng với chia sẻ trên đây sẽ giúp các bạn có thêm cách phòng chống dịch cúm Corona. Tuy nhiên, khi thấy bản thân hoặc người trong gia đình bị ho, sốt, khó thở cần phải đến cơ sở y tế gần nhất để kiểm tra sức khỏe.',
		N'2.jpg'
	),
	(
		N'00003',
		N 'GIẢM CÂN BẰNG HOA QUẢ TƯƠI CÓ THỰC SỰ HIỆU QUẢ?',
		N 'Giảm cân bằng hoa quả tươi có thực sự hiệu quả?
Đây là một số tin tốt nếu bạn yêu thích các loại hoa quả nhập khẩu: Táo, các loại dâu, lê. Ăn trái cây liệu có phải là phương pháp giảm cân hiệu quả. Đúng, trái cây chứa carbs và đường tự nhiên. Nhưng có những lý do quan trọng để làm cho trái cây trở thành một loại thực phẩm hàng ngày trong chế độ ăn uống của bạn, ngay cả khi bạn giảm cân. Điều quan trọng là phải ăn hoa quả theo một chế độ khoa học thì việc giảm cân mới thành công.

Sự liên quan giữa các chất tự nhiên trong hoa quả với việc giảm cân.
Các chất tự nhiên trong hoa quả, bao gồm vitamin, khoáng chất, chất chống oxy hóa, chất xơ và prebiotic, cực kỳ tốt cho bạn, không chỉ trong việc bảo vệ chống lại các bệnh mãn tính mà còn giúp kiểm soát cân nặng của bạn. 

Trong nghiên cứu, hoa quả thực sự đã được gắn liền với giảm cân, không làm tăng cân. Một nghiên cứu cho thấy những người trưởng thành thừa cân và béo phì ăn nhiều trái cây sẽ giảm cân nhiều hơn so với những người không ăn. Một nghiên cứu khác, theo dõi hơn 130.000 người trưởng thành trong 24 năm, cho thấy tiêu thụ trái cây có liên quan đến việc giảm cân được cải thiện theo thời gian.

Liên kết này có thể là vì trái cây có thể giúp tăng cảm giác no, thỏa mãn cơn thèm ngọt và giảm ham muốn đào sâu vào các món ngon như kẹo hoặc đồ nướng. Trái cây cũng có xu hướng thay thế các món ăn có lượng calo cao hơn, trong khi rau có xu hướng trở thành món bổ sung. Nói cách khác, bạn có nhiều khả năng chọn một quả táo hơn là một miếng bông cải xanh thay cho bánh quy; và sự hoán đổi đó có thể giúp bạn hạn chế tổng lượng calo và tránh thêm đường, thủ phạm thực sự gây ra việc tăng cân.


Cách ăn hoa quả để giảm cân hiệu quả.
So sánh với một muỗng canh đường, chứa 16 gram carbs và không có chất dinh dưỡng. Về cơ bản, toàn bộ, hoa quả tươi và đường không cùng chung một loại.

Tất nhiên, điều đó không có nghĩa là bạn có thể ăn không giới hạn số lượng trái cây. Trái cây có chứa carbohydrate, và công việc của carbs là thúc đẩy hoạt động của các tế bào của bạn. Khi bạn ăn nhiều carbs hơn mức bạn có thể đốt cháy sau bữa ăn hoặc bữa ăn nhẹ, thậm chí từ trái cây, thặng dư không cần thiết có thể cung cấp chất béo hiện có, hoặc làm đầy các tế bào mỡ.

Vì lý do này, tổng lượng carb của bạn, bao gồm cả trái cây, nên tương ứng với nhu cầu phù hợp với thể trạng của bạn, dựa trên chiều cao, cân nặng lý tưởng, giới tính, tuổi tác và mức độ hoạt động thể chất của bạn. Hầu hết nữ giới có thể đủ khả năng ăn hai phần trái cây mỗi ngày (nhiều hơn nếu họ cao hơn hoặc năng động hơn), với một khẩu phần là một cốc, hoặc một miếng có kích thước bằng một quả bóng chày.

Vì carbs trong trái cây giúp cung cấp năng lượng, khi bạn ăn trái cây cũng vậy. Ví dụ: Ăn một dĩa nho kẹo xanh vào đêm khuya trong khi bạn đang xem TV hoặc lướt web (khi nhu cầu năng lượng của bạn thấp) thì không có ý nghĩa gì cả. Thay vào đó, lên khẩu phần trái cây vào các bữa ăn và đồ ăn nhẹ bạn tiêu thụ trước giờ hoạt động nhiều hơn trong ngày. Chẳng hạn, bạn có thể ăn một quả chuối nhỏ 20 hoặc 30 phút trước khi tập luyện thể dục, hoặc ăn quả mọng với bữa sáng trước khi đi làm việc và kết hợp một quả táo với bơ hạnh nhân vào buổi chiều để giúp cung cấp năng lượng cho cả ngày.


Theo như loại trái cây bạn chọn, hãy cố gắng có được một loại tốt để đưa cơ thể bạn hấp thụ hết các chất dinh dưỡng và chất chống oxy hóa. Không có trái cây nào vượt quá giới hạn nếu bạn phải suy nghĩ kỹ về số lượng và thời gian. Ví dụ, trong khi dưa hấu là một loại trái cây có chỉ số đường huyết cao, hãy thưởng thức nó khi vào mùa một lượng vừa đủ, vì một cốc chứa ít hơn 50 calo, và nó cung cấp vitamin C, kali và chất chống oxy hóa gắn với khả năng chống viêm, bảo vệ chống lại bệnh tim, và cải thiện sức bền tập thể dục và phục hồi.

Tóm lại: Hoa quả tươi là vô cùng bổ dưỡng và không phải là vỗ béo. Tác động của nó đến cân nặng của bạn phụ thuộc vào thời điểm bạn tiêu thụ nó, và bạn ăn bao nhiêu. Không ăn trái cây hoàn toàn có thể phản tác dụng để giảm cân, và tác động tiêu cực đến sức khỏe tổng thể của bạn. Thay vào đó, hãy đạt được sự cân bằng phù hợp để gặt hái tất cả những lợi ích của trái cây và vẫn đạt được mục tiêu giảm cân của bạn.

giảm cân bằng hoa quả tươi 3
Một khi đã lựa chọn giảm cân bằng hoa quả thì ưu tiên hàng đầu phải là sự tươi ngon và an toàn của trái cây. Shophoaqua.vn hân hạnh phục vụ Qúy khách hàng đa dạng các loại hoa quả từ Việt Nam cho đến trái cây nhập khẩu chất lượng cao, đảm bảo nguồn gốc xuất xứ rõ ràng và giá cả phải chăng',
		N'3.jpg'
	),
	(
		N'00004',
		N 'CÁCH BẢO QUẢN TRÁI CÂY GỌT SẴN LUÔN TƯƠI NGON',
		N 'Chắc đã không ít lần bạn thắc mắc, tại sao những chỗ bán trái cây gọt sẵn, những hộp trái cây của họ luôn tươi ngon như vậy. Trong khi ở nhà mình, trái cây vừa cắt ra đã ngay lập tức bị đổi màu, có khi còn thâm dập.

Cách bảo quản trái cây gọt sẵn
Tất cả đều có bí quyết. Sau đây, shophoaqua.vn sẽ bật mí cho bạn một vài cách để giữ hoa quả cắt sẵn không bị đổi màu, bầm dập, để bạn luôn có những đĩa hoa quả tươi ngon nhất cho gia đình. Hầu hết tất cả các loại trái cây đều có cách bảo quản như nhau, tuy nhiên, cũng sẽ có một vài loại đặc biệt như táo và lê chẳng hạn. Sau đây chúng ta sẽ cùng nhau tìm hiểu nhé!

Bảo quản táo và lê sau khi gọt vỏ

Lê và táo gọt sẵn là 2 loại quả dễ bị thâm dập sau khi gọt, cần phải bảo quản đúng cách để quả luôn tươi ngon

Táo và lê chính là 2 loại quả “gây phiền muộn” nhiều nhất bởi có khi, bạn chưa gọt xong thì chúng đã bị bầm rồi. Để không còn gặp những tình trạng như trên, các bạn hãy gọt táo, lê ở nơi kín gió, sau khi gọt xong thì ngay lập tức ngâm vào 1 trong 2 dung dịch sau:

Nước muối pha thật loãng
Nước ấm pha 1 thìa nước cốt chanh
Sau khi vớt quả ra khỏi dung dịch, hay để ráo nước và cho quả vào hộp đóng kín, hoặc cho lên đĩa và bọc bằng màng bọc thực phẩm, sau đó cho vào ngăn mát thực phẩm để quả tươi và giòn nhé.

Bảo quản đu đủ, dưa hấu và dưa lưới sau khi gọt vỏ
Đây là 3 loại quả tương đối “dễ chịu” hơn vì chúng sẽ không có tình trạng thâm, dập ngay lập tức, mà chỉ khi để bên ngoài khá lâu thì mới bị đổi vị. Với 3 loại hoa quả bổ sẵn này, chúng ta chỉ cần để ráo, sau đó cho vào hộp đóng kín, hoặc dùng màng bọc thực phẩm để bọc lại, sau đó cho vào ngăn mát tủ lạnh để giữ được độ tươi ngon cho chúng.

Bảo quản cam, quýt, dứa gọt sẵn
Cam quýt sau khi gọt sẵn nên để khô ráo và bọc bằng màng bọc thực phẩm, tránh cho tiếp xúc với không khí để giữ nguyên vị tươi, ngọt cho quả.


Một số lưu ý khác với hoa quả tươi gọt sẵn
Khi bảo quản hoa quả, hãy tách riêng từng loại quả để đảm bảo vị ngon được giữ trọn vẹn.
Những mẹo trên đây có thể giúp bạn bảo quản hoa quả tươi gọt sẵn ngon suốt cả một ngày. Tuy nhiên bạn nên nhớ rằng, hoa quả gọt sẵn chỉ nên được sử dụng trong vòng tối đa 8h để đảm bảo những vitamin trong quả được cơ thể hấp thụ là đầy đủ và tốt nhất nhé.',
		N'1.jpg'
	);

Select
	*
from
	Account
	