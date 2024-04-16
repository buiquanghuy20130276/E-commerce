/*
 Navicat Premium Data Transfer

 Source Server         : LocalHost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : happyhome

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 20/03/2024 22:02:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (1, 'KOLDING Collection');

-- ----------------------------
-- Table structure for collection_detail
-- ----------------------------
DROP TABLE IF EXISTS `collection_detail`;
CREATE TABLE `collection_detail`  (
  `id_detail` int NOT NULL AUTO_INCREMENT,
  `id_collection` int NULL DEFAULT NULL,
  `id_product` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_detail`) USING BTREE,
  INDEX `id_collect`(`id_collection` ASC) USING BTREE,
  INDEX `id_pro`(`id_product` ASC) USING BTREE,
  CONSTRAINT `collection_detail_ibfk_1` FOREIGN KEY (`id_collection`) REFERENCES `collection` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `collection_detail_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collection_detail
-- ----------------------------
INSERT INTO `collection_detail` VALUES (1, 1, 1);
INSERT INTO `collection_detail` VALUES (2, 1, 2);
INSERT INTO `collection_detail` VALUES (3, 1, 3);
INSERT INTO `collection_detail` VALUES (4, 1, 4);
INSERT INTO `collection_detail` VALUES (5, 1, 5);

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites`  (
  `favorite_product_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`favorite_product_id`) USING BTREE,
  INDEX `fv_pro`(`product_id` ASC) USING BTREE,
  INDEX `fv_u`(`user_name` ASC) USING BTREE,
  CONSTRAINT `fv_pro` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fv_u` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES (1, 'dung4', 3);
INSERT INTO `favorites` VALUES (2, 'huyen', 8);
INSERT INTO `favorites` VALUES (3, 'huyen', 2);
INSERT INTO `favorites` VALUES (4, 'dung4', 11);
INSERT INTO `favorites` VALUES (5, 'huyen', 20);
INSERT INTO `favorites` VALUES (7, 'dung4', 2);

-- ----------------------------
-- Table structure for forget_password
-- ----------------------------
DROP TABLE IF EXISTS `forget_password`;
CREATE TABLE `forget_password`  (
  `uid` int NOT NULL,
  `token` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `token_expiry` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uid`, `token`) USING BTREE,
  UNIQUE INDEX `token`(`token` ASC) USING BTREE,
  CONSTRAINT `forget_password_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of forget_password
-- ----------------------------
INSERT INTO `forget_password` VALUES (68, 'lsM1O5ksaiU-STkHUExdQvQji1NjZ3Qy', '2023-06-21 06:07:03', '2023-06-21 06:17:03');

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`img_id`) USING BTREE,
  INDEX `fkimg`(`product_id` ASC) USING BTREE,
  CONSTRAINT `fkimg` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 494 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, 2, 'https://muasam365.net/pictures/picfullsizes/2021/10/05/hrf1633425690.jpg');
INSERT INTO `images` VALUES (2, 2, 'https://muasam365.net/pictures/picfullsizes/2021/10/05/bfc1633425690.jpg');
INSERT INTO `images` VALUES (3, 2, 'https://muasam365.net/pictures/picfullsizes/2021/10/05/xir1633425690.jpg');
INSERT INTO `images` VALUES (4, 2, 'https://muasam365.net/pictures/picfullsizes/2021/10/05/kbn1633425690.jpg');
INSERT INTO `images` VALUES (32, 3, 'https://product.hstatic.net/200000065946/product/pro_xanh_noi_that_moho_tu_giay_3_tang_1_6e7c124153fb4356b875a83fd8da49ad_master.jpg');
INSERT INTO `images` VALUES (33, 3, 'https://product.hstatic.net/200000065946/product/pro_xanh_noi_that_moho_tu_giay_3_tang_4_30494f0d458143b3ace631419107c607_master.jpg');
INSERT INTO `images` VALUES (34, 3, 'https://product.hstatic.net/200000065946/product/pro_xanh_noi_that_moho_tu_giay_3_tang_2_15fff5fbf8484f62a09ed140a5906028_master.jpg');
INSERT INTO `images` VALUES (35, 3, 'https://product.hstatic.net/200000065946/product/pro_xanh_noi_that_moho_tu_giay_3_tang_3_dfcd796e46fd4f11979fe085ad8611bb_master.jpg');
INSERT INTO `images` VALUES (36, 4, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_tra_sofa_go_tron_oslo_1_263a4ddc3999406b8c3ad6fe4120b654_master.jpg');
INSERT INTO `images` VALUES (37, 4, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_tra_sofa_go_tron_oslo_2_e36fb60e3892425bbad5ccb58590c8a1_master.jpg');
INSERT INTO `images` VALUES (38, 4, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_tra_sofa_go_tron_oslo_3_9edb73abacef40fb9379c591bf47fb13_master.jpg');
INSERT INTO `images` VALUES (39, 4, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ban_tra_sofa_go_tron_oslo_4_84cb419f08e1469b9cdf136885add625_master.jpg');
INSERT INTO `images` VALUES (40, 5, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_1_5211e7d2a3da44f58070de291c446400_master.jpg');
INSERT INTO `images` VALUES (41, 5, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_2_09e6f0afa7684efcbb049ae74aa0c183_master.jpg');
INSERT INTO `images` VALUES (42, 5, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_4_3a4d2a739c53492fb13cf2b06183f1fb_master.jpg');
INSERT INTO `images` VALUES (43, 5, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_vline_1m8_3_bcf9f9d31e2f4ed59119bc0a146c1702_master.jpg');
INSERT INTO `images` VALUES (44, 6, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_1_e2e0f1d592c34753b5c755af1444ecc2_master.jpg');
INSERT INTO `images` VALUES (45, 6, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_2_847c0e08233e4c02bb7aef01493dacfe_master.jpg');
INSERT INTO `images` VALUES (46, 6, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_3_c232605a28a941439875a0dae3c10a1f_master.jpg');
INSERT INTO `images` VALUES (47, 6, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_van_phong_chan_quy_4_ad8edfc784de4f73879b8b3781f97a4a_master.jpg');
INSERT INTO `images` VALUES (48, 7, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_don_sofa_vline_dem_be_4_25293fd64e1146188437415b13cf2353_master.jpg');
INSERT INTO `images` VALUES (49, 7, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_don_sofa_vline_dem_be_1_d25e7a0c9a874e9399c7b3ccaa137167_master.jpg');
INSERT INTO `images` VALUES (50, 7, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_don_sofa_vline_dem_be_1_d25e7a0c9a874e9399c7b3ccaa137167_master.jpg');
INSERT INTO `images` VALUES (51, 7, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_don_sofa_vline_dem_be_2_0ed87ab7bd2f481481ef950afb9a4e8d_master.jpg');
INSERT INTO `images` VALUES (52, 8, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_cao_su_tu_nhien_nexo_1_6a5ac2217241473cb6978eac22fe5189_master.jpg');
INSERT INTO `images` VALUES (53, 8, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_cao_su_tu_nhien_nexo_2_4404f143e77e4c8e90c5dbbff8abfa26_master.jpg');
INSERT INTO `images` VALUES (54, 8, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_cao_su_tu_nhien_nexo_3_95f5411daeba45e59a30a8c40198056b_master.jpg');
INSERT INTO `images` VALUES (55, 8, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_ghe_an_go_cao_su_tu_nhien_nexo_4_bed804a0b24b4c7988fe47be905df36c_master.jpg');
INSERT INTO `images` VALUES (56, 9, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_6_aaa7b6c7cc964c3c8cdeea305bb8f692_master.jpg');
INSERT INTO `images` VALUES (57, 9, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_1_792c0ebcacf24ab49f42e3b55eab0cff_master.jpg');
INSERT INTO `images` VALUES (58, 9, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_2_ab0a0d68db034ac385354c2cb9ffbbca_master.jpg');
INSERT INTO `images` VALUES (59, 9, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_ban_an_go_cao_su_odense_3_af65932c768b40bfaf8298cda9366af9_master.jpg');
INSERT INTO `images` VALUES (60, 10, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_3_4af19c496b754183a4577bc8b558762d_master.jpg');
INSERT INTO `images` VALUES (61, 10, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_4_481442b439dc489692b8cf66ecc49e4f_master.jpg');
INSERT INTO `images` VALUES (62, 10, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_5_04bf44e734a7435094b31651a0ccff98_master.jpg');
INSERT INTO `images` VALUES (63, 10, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ghe_an_go_viborg_trang_6_8e3ec3e92a0b47fbae667b5fea0e27e4_master.jpg');
INSERT INTO `images` VALUES (64, 12, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_an_go_nyborg_6_c55ca9a6feab482991c5e641fab21ba7_master.jpg');
INSERT INTO `images` VALUES (65, 12, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_an_go_nyborg_1_260a21deeddc4d3fb8a2b5c38f0ca3c7_master.jpg');
INSERT INTO `images` VALUES (66, 12, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_an_go_nyborg_2_061674456d2847ae907d4d65af8224fc_master.jpg');
INSERT INTO `images` VALUES (67, 12, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ban_an_go_nyborg_3_f54ab62c01084fb4bc7283f9e143e563_master.jpg');
INSERT INTO `images` VALUES (68, 11, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_an_go_nyborg_1_3466d41532124dee8fdaf9a0c314f9bf_master.jpg');
INSERT INTO `images` VALUES (69, 11, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_an_go_nyborg_3_b391054648704f86b7aba316cc976d81_master.jpg');
INSERT INTO `images` VALUES (70, 11, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_an_go_nyborg_4_624edf9545284128b364bf8850bb2556_master.jpg');
INSERT INTO `images` VALUES (71, 11, 'https://product.hstatic.net/200000065946/product/pro_den_noi_that_moho_ghe_an_go_nyborg_5_572b3dea20b74ca39ba3ed1be7e71414_master.jpg');
INSERT INTO `images` VALUES (73, 13, 'https://homeoffice.com.vn/images/detailed/35/sofa-bang-2m-nem-simili-sfb68041-01.jpg');
INSERT INTO `images` VALUES (74, 13, 'https://homeoffice.com.vn/images/detailed/35/sofa-bang-2m-nem-simili-sfb68041-02.jpg');
INSERT INTO `images` VALUES (75, 13, 'https://homeoffice.com.vn/images/detailed/35/sofa-bang-2m-nem-simili-sfb68041-03.jpg');
INSERT INTO `images` VALUES (76, 13, 'https://homeoffice.com.vn/images/detailed/35/sofa-bang-2m-nem-simili-sfb68041-04.jpg');
INSERT INTO `images` VALUES (77, 14, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/61/ghe-cafe-nem-simili-khung-sat-ttg014-02a.jpg');
INSERT INTO `images` VALUES (78, 14, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/61/ghe-cafe-nem-simili-khung-sat-ttg014-03a.jpg');
INSERT INTO `images` VALUES (79, 14, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/61/ghe-cafe-nem-simili-khung-sat-ttg014-04a.jpg');
INSERT INTO `images` VALUES (80, 14, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/61/ghe-cafe-nem-simili-khung-sat-ttg014-05a.jpg');
INSERT INTO `images` VALUES (81, 15, 'https://homeoffice.com.vn/images/detailed/61/sofa-don-GSD68064-02a.jpg');
INSERT INTO `images` VALUES (82, 15, 'https://homeoffice.com.vn/images/detailed/61/sofa-don-GSD68064-03a.jpg');
INSERT INTO `images` VALUES (83, 15, 'https://homeoffice.com.vn/images/detailed/61/sofa-don-GSD68064-04a.jpg');
INSERT INTO `images` VALUES (84, 15, 'https://homeoffice.com.vn/images/detailed/61/sofa-don-GSD68064-05a.jpg');
INSERT INTO `images` VALUES (85, 16, 'https://homeoffice.com.vn/images/detailed/60/tu-trang-tri-ktb68123-04a.jpg');
INSERT INTO `images` VALUES (86, 16, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trang-tri-ktb68123-05a.jpg');
INSERT INTO `images` VALUES (87, 16, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trang-tri-ktb68123-06a.jpg');
INSERT INTO `images` VALUES (88, 16, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trang-tri-ktb68123-07a.jpg');
INSERT INTO `images` VALUES (89, 17, 'https://homeoffice.com.vn/images/detailed/57/tu-trang-tri-ktb68119-12.jpg');
INSERT INTO `images` VALUES (90, 17, 'https://homeoffice.com.vn/images/detailed/57/tu-trang-tri-ktb68119-11.png');
INSERT INTO `images` VALUES (91, 17, 'https://homeoffice.com.vn/images/detailed/57/tu-trang-tri-ktb68119-13.jpg');
INSERT INTO `images` VALUES (92, 17, 'https://homeoffice.com.vn/images/detailed/57/tu-trang-tri-ktb68119-14.jpg');
INSERT INTO `images` VALUES (93, 18, 'https://homeoffice.com.vn/images/detailed/53/sofa-bang-phong-cach-indochine-sfb68060-04.jpg');
INSERT INTO `images` VALUES (94, 18, 'https://homeoffice.com.vn/images/detailed/53/sofa-bang-phong-cach-indochine-sfb68060-05.jpg');
INSERT INTO `images` VALUES (95, 18, 'https://homeoffice.com.vn/images/detailed/53/sofa-bang-phong-cach-indochine-sfb68060-06.jpg');
INSERT INTO `images` VALUES (96, 18, 'https://homeoffice.com.vn/images/detailed/53/sofa-bang-phong-cach-indochine-sfb68060-01.png');
INSERT INTO `images` VALUES (97, 19, 'https://homeoffice.com.vn/images/detailed/33/ban-sofa-2-tang-07.jpg');
INSERT INTO `images` VALUES (98, 19, 'https://homeoffice.com.vn/images/detailed/33/ban-sofa-2-tang-02.jpg');
INSERT INTO `images` VALUES (99, 19, 'https://homeoffice.com.vn/images/detailed/33/ban-sofa-2-tang-03.jpg');
INSERT INTO `images` VALUES (100, 19, 'https://homeoffice.com.vn/images/detailed/33/ban-sofa-2-tang-04.jpg');
INSERT INTO `images` VALUES (101, 20, 'https://homeoffice.com.vn/images/detailed/8/giuong-ngu-ferro-2.jpg');
INSERT INTO `images` VALUES (102, 20, 'https://homeoffice.com.vn/images/detailed/8/giuong-ngu-ferro-1.jpg');
INSERT INTO `images` VALUES (103, 20, 'https://homeoffice.com.vn/images/detailed/8/giuong-ngu-ferro-3.jpg');
INSERT INTO `images` VALUES (104, 20, 'https://homeoffice.com.vn/images/detailed/8/giuong-ngu-ferro-%C3%B4.jpg');
INSERT INTO `images` VALUES (105, 1, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/sofa-bang-SFB68071-05.jpg');
INSERT INTO `images` VALUES (106, 1, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/sofa-bang-SFB68071-06.jpg');
INSERT INTO `images` VALUES (227, 1, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/sofa-bang-SFB68071-02.jpg');
INSERT INTO `images` VALUES (228, 1, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/sofa-bang-SFB68071-04.jpg');
INSERT INTO `images` VALUES (233, 25, 'https://homeoffice.com.vn/images/detailed/67/ban-lam-viec-don-gian-go-keo-2.jpg');
INSERT INTO `images` VALUES (234, 25, 'https://homeoffice.com.vn/images/detailed/67/ban-lam-viec-don-gian-go-keo-3.jpg');
INSERT INTO `images` VALUES (235, 25, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-lam-viec-don-gian-go-keo-4.jpg');
INSERT INTO `images` VALUES (236, 25, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-lam-viec-don-gian-go-keo-6.jpg');
INSERT INTO `images` VALUES (237, 26, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/68/ban-lam-viec-wooden-chan-sat-chu-a-he-minimal-5.jpg');
INSERT INTO `images` VALUES (238, 26, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/68/ban-lam-viec-wooden-chan-sat-chu-a-he-minimal-10.jpg');
INSERT INTO `images` VALUES (239, 26, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/68/ban-lam-viec-wooden-chan-sat-chu-a-he-minimal-6.jpg');
INSERT INTO `images` VALUES (240, 26, 'https://homeoffice.com.vn/images/detailed/68/ban-lam-viec-wooden-chan-sat-chu-a-he-minimal-2.jpg');
INSERT INTO `images` VALUES (241, 27, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/39/ban-lam-viec-go-tram-canh-gian-he-aconcept-HBWD046-02.jpg');
INSERT INTO `images` VALUES (242, 27, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/39/ban-lam-viec-go-tram-canh-gian-he-aconcept-HBWD046-01.jpg');
INSERT INTO `images` VALUES (243, 27, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/39/ban-lam-viec-go-tram-canh-gian-he-aconcept-HBWD046-03.jpg');
INSERT INTO `images` VALUES (244, 27, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/39/ban-lam-viec-go-tram-canh-gian-he-aconcept-HBWD046-06.jpg');
INSERT INTO `images` VALUES (245, 28, 'https://homeoffice.com.vn/images/detailed/64/ban-120x60cm-go-plywood-he-ychi-HBYC013-02.jpg');
INSERT INTO `images` VALUES (246, 28, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/ban-120x60cm-go-plywood-he-ychi-HBYC013-03.jpg');
INSERT INTO `images` VALUES (247, 28, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/ban-120x60cm-go-plywood-he-ychi-HBYC013-04.jpg');
INSERT INTO `images` VALUES (248, 28, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/ban-120x60cm-go-plywood-he-ychi-HBYC013-05.jpg');
INSERT INTO `images` VALUES (249, 29, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-chan-xoay-hogvp149-01a.jpg');
INSERT INTO `images` VALUES (250, 29, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/63/ghe-chan-xoay-hogvp149-09.jpg');
INSERT INTO `images` VALUES (251, 29, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-chan-xoay-hogvp149-02a.jpg');
INSERT INTO `images` VALUES (252, 29, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-chan-xoay-hogvp149-03a.jpg');
INSERT INTO `images` VALUES (253, 30, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-lam-viec-gak673x-01a.jpg');
INSERT INTO `images` VALUES (254, 30, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-lam-viec-gak673x-02a.jpg');
INSERT INTO `images` VALUES (255, 30, 'https://homeoffice.com.vn/images/detailed/60/ghe-lam-viec-gak673x-03a.jpg');
INSERT INTO `images` VALUES (256, 30, 'https://homeoffice.com.vn/images/detailed/60/ghe-lam-viec-gak673x-04a.jpg');
INSERT INTO `images` VALUES (257, 31, 'https://homeoffice.com.vn/images/detailed/60/ghe-lam-viec-gak188-mau-nau-01.jpg');
INSERT INTO `images` VALUES (258, 31, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-lam-viec-gak188-01.jpg');
INSERT INTO `images` VALUES (259, 31, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-lam-viec-gak188-08.jpg');
INSERT INTO `images` VALUES (260, 31, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ghe-lam-viec-gak188-02a.jpg');
INSERT INTO `images` VALUES (261, 32, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ke-sach-go-mini-di-dong-2.jpg');
INSERT INTO `images` VALUES (262, 32, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ke-sach-go-mini-di-dong-3.jpg');
INSERT INTO `images` VALUES (263, 32, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ke-sach-go-mini-di-dong-3.jpg');
INSERT INTO `images` VALUES (264, 32, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ke-sach-go-mini-di-dong-5.jpg');
INSERT INTO `images` VALUES (265, 33, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trung-bay-go-tu-nhien-ktb68127-01.jpg');
INSERT INTO `images` VALUES (266, 33, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trung-bay-go-tu-nhien-ktb68127-02.jpg');
INSERT INTO `images` VALUES (267, 33, 'https://homeoffice.com.vn/images/detailed/60/tu-trung-bay-go-tu-nhien-ktb68127-03a.jpg');
INSERT INTO `images` VALUES (268, 33, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/tu-trung-bay-go-tu-nhien-ktb68127-04a.jpg');
INSERT INTO `images` VALUES (269, 34, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-sach-nho-don-gian-go-1.jpg');
INSERT INTO `images` VALUES (270, 34, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-sach-nho-don-gian-go-2.jpg');
INSERT INTO `images` VALUES (271, 34, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-sach-nho-don-gian-go-2_a2sg-ff.jpg');
INSERT INTO `images` VALUES (272, 34, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-sach-nho-don-gian-go-3.jpg');
INSERT INTO `images` VALUES (273, 35, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ghe-cafe-tung-tua-boc-nem-chan-sat-son-tinh-dien-2.jpg');
INSERT INTO `images` VALUES (274, 35, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ghe-cafe-tung-tua-boc-nem-chan-sat-son-tinh-dien-2.jpg');
INSERT INTO `images` VALUES (275, 35, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ghe-cafe-tung-tua-boc-nem-chan-sat-son-tinh-dien-3.jpg');
INSERT INTO `images` VALUES (276, 35, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/66/ghe-cafe-tung-tua-boc-nem-chan-sat-son-tinh-dien-3_v2jk-de.jpg');
INSERT INTO `images` VALUES (277, 36, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-xep-cafe-lung-cao-2.jpg');
INSERT INTO `images` VALUES (278, 36, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-xep-cafe-lung-cao-5.jpg');
INSERT INTO `images` VALUES (279, 36, 'https://homeoffice.com.vn/images/detailed/67/ghe-xep-cafe-lung-cao-6.jpg');
INSERT INTO `images` VALUES (280, 36, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-xep-cafe-lung-cao-6_lry5-v1.jpg');
INSERT INTO `images` VALUES (281, 37, 'https://homeoffice.com.vn/images/detailed/65/ghe-don-tron-bang-go-cao-su-3.jpg');
INSERT INTO `images` VALUES (282, 37, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ghe-don-tron-bang-go-cao-su-3.jpg');
INSERT INTO `images` VALUES (283, 37, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ghe-don-tron-bang-go-cao-su-4.jpg');
INSERT INTO `images` VALUES (284, 37, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ghe-don-tron-bang-go-cao-su-5.jpg');
INSERT INTO `images` VALUES (285, 38, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/33/ban-an-tron-chan-sat-ba68044-1.jpg');
INSERT INTO `images` VALUES (286, 38, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/33/ban-an-tron-chan-sat-ba68044-2.jpg');
INSERT INTO `images` VALUES (287, 38, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/33/ban-an-tron-chan-sat-ba68044-03.jpg');
INSERT INTO `images` VALUES (288, 38, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/33/ban-an-tron-chan-sat-ba68044-04.jpg');
INSERT INTO `images` VALUES (289, 39, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/21/ban-an-vuong-70cm.jpeg');
INSERT INTO `images` VALUES (290, 39, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/21/ban-cafe-uban-CFD68033-02.jpg');
INSERT INTO `images` VALUES (291, 39, 'https://homeoffice.com.vn/images/detailed/21/ban-cafe-uban-CFD68033-03.jpg');
INSERT INTO `images` VALUES (292, 39, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/21/ban-cafe-uban-CFD68033-04.jpg');
INSERT INTO `images` VALUES (293, 40, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/giuong-tang-khung-sat-hien-dai-5.jpg');
INSERT INTO `images` VALUES (294, 40, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/giuong-tang-khung-sat-hien-dai-2.jpg');
INSERT INTO `images` VALUES (295, 40, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/giuong-tang-khung-sat-hien-dai-3.jpg');
INSERT INTO `images` VALUES (296, 40, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/giuong-tang-khung-sat-hien-dai-4.jpg');
INSERT INTO `images` VALUES (297, 41, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/35/giuong-ngu-doi-co-hoc-keo-gn68035-01.jpg');
INSERT INTO `images` VALUES (298, 41, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/35/giuong-ngu-doi-co-hoc-keo-gn68035-02.jpg');
INSERT INTO `images` VALUES (299, 41, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/35/giuong-ngu-doi-co-hoc-keo-gn68035-03.jpg');
INSERT INTO `images` VALUES (300, 41, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/35/giuong-ngu-doi-co-hoc-keo-gn68035-04.jpg');
INSERT INTO `images` VALUES (301, 42, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/35/giuong-ket-hop-tu-quan-ao-gt009-01.jpg');
INSERT INTO `images` VALUES (302, 42, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/35/giuong-ket-hop-tu-quan-ao-gt009-02.jpg');
INSERT INTO `images` VALUES (303, 42, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/35/giuong-ket-hop-tu-quan-ao-gt009-03.jpg');
INSERT INTO `images` VALUES (304, 42, 'https://homeoffice.com.vn/images/detailed/35/giuong-ket-hop-tu-quan-ao-gt009-04.jpg');
INSERT INTO `images` VALUES (305, 43, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/35/giuong-tang-go-khung-sat-GT012-02a.jpg');
INSERT INTO `images` VALUES (306, 43, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/36/giuong-tang-go-khung-sat-GT012-03.jpg');
INSERT INTO `images` VALUES (307, 43, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/36/giuong-tang-go-khung-sat-GT012-04.jpg');
INSERT INTO `images` VALUES (308, 43, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/36/giuong-tang-go-khung-sat-GT012-05.jpg');
INSERT INTO `images` VALUES (309, 44, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/5/ke-treo-do-ong-nuoc-KTD68004-02.jpg');
INSERT INTO `images` VALUES (310, 44, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/5/ke-treo-do-ong-nuoc-KTD68004-03.jpg');
INSERT INTO `images` VALUES (311, 44, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/5/ke-treo-do-ong-nuoc-KTD68004-04.jpg');
INSERT INTO `images` VALUES (312, 44, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/5/ke-treo-do-ong-nuoc-KTD68004-05.jpg');
INSERT INTO `images` VALUES (313, 45, 'https://homeoffice.com.vn/images/detailed/65/ke-trang-tri-co-ngan-de-cay-xanh-2.jpg');
INSERT INTO `images` VALUES (314, 45, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-trang-tri-co-ngan-de-cay-xanh-3.jpg');
INSERT INTO `images` VALUES (315, 45, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-trang-tri-co-ngan-de-cay-xanh-4.jpg');
INSERT INTO `images` VALUES (316, 45, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-trang-tri-co-ngan-de-cay-xanh-5.jpg');
INSERT INTO `images` VALUES (317, 47, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/ke-giay-kg68069-07.jpg');
INSERT INTO `images` VALUES (318, 47, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/ke-giay-kg68069-02.jpg');
INSERT INTO `images` VALUES (319, 47, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/ke-giay-kg68069-03.jpg');
INSERT INTO `images` VALUES (320, 47, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/ke-giay-kg68069-04.jpg');
INSERT INTO `images` VALUES (321, 46, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/ke-giay-KG68060-02_52jr-ae.jpg');
INSERT INTO `images` VALUES (322, 46, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/ke-giay-KG68060-03_18i1-az.jpg');
INSERT INTO `images` VALUES (323, 46, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/ke-giay-KG68060-04_pmh1-fd.jpg');
INSERT INTO `images` VALUES (324, 46, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/58/ke-giay-KG68060-06.jpg');
INSERT INTO `images` VALUES (325, 47, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/56/ke-sach-KS68167-3.jpg');
INSERT INTO `images` VALUES (326, 47, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/56/ke-sach-KS68167-7.jpg');
INSERT INTO `images` VALUES (327, 47, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/56/ke-sach-KS68167-6.jpg');
INSERT INTO `images` VALUES (328, 47, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/56/ke-sach-trang-tri-KS68167-05.jpg');
INSERT INTO `images` VALUES (329, 48, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ban-gap-go-cao-su-SPD68188-02.jpeg');
INSERT INTO `images` VALUES (330, 48, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ban-gap-go-cao-su-SPD68188-03.jpeg');
INSERT INTO `images` VALUES (331, 48, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ban-gap-go-cao-su-SPD68188-04.jpg');
INSERT INTO `images` VALUES (332, 48, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ban-lam-viec-gap-gon-co-banh-xe-di-dong-5.jpg');
INSERT INTO `images` VALUES (333, 49, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/56/ban-ket-hop-ke-go-chan-sat-BD68088-03a.jpg');
INSERT INTO `images` VALUES (334, 49, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/56/ban-ket-hop-ke-go-chan-sat-BD68088-04a.jpg');
INSERT INTO `images` VALUES (335, 49, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/62/ban-ket-hop-ke-go-chan-sat-BD68088-06a.jpg');
INSERT INTO `images` VALUES (336, 49, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/62/ban-ket-hop-ke-go-chan-sat-BD68088-07a.jpg');
INSERT INTO `images` VALUES (337, 50, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-khung-sat-KTV68097-02a.jpg');
INSERT INTO `images` VALUES (338, 50, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-khung-sat-KTV68097-03a.jpg');
INSERT INTO `images` VALUES (339, 50, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-khung-sat-KTV68097-04a.jpg');
INSERT INTO `images` VALUES (340, 50, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-KTV68097-04a.jpg');
INSERT INTO `images` VALUES (341, 51, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-tu-nhien-KTV68098-10a_znyb-2t.jpg');
INSERT INTO `images` VALUES (342, 51, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-tu-nhien-KTV68098-09a.jpg');
INSERT INTO `images` VALUES (343, 51, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-tu-nhien-KTV68098-08a_4pvs-wl.jpg');
INSERT INTO `images` VALUES (344, 51, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-tu-nhien-KTV68098-11a.jpg');
INSERT INTO `images` VALUES (345, 52, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ke-tivi-go-nau-lau-KTV68096-02a.jpg');
INSERT INTO `images` VALUES (346, 52, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ke-tivi-go-nau-lau-KTV68096-03a.jpg');
INSERT INTO `images` VALUES (347, 52, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ke-tivi-go-nau-lau-KTV68096-04a.jpg');
INSERT INTO `images` VALUES (348, 52, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ke-tivi-KTV68099-06a.jpg');
INSERT INTO `images` VALUES (349, 53, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ke-tivi-go-cahn-sat-KTV68095_-02a.jpg');
INSERT INTO `images` VALUES (350, 53, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ke-tivi-go-cahn-sat-KTV68095_-03a.jpg');
INSERT INTO `images` VALUES (351, 53, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ke-tivi-go-cahn-sat-KTV68095_-04a.jpg');
INSERT INTO `images` VALUES (352, 53, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/59/ke-tivi-KTV68095-06a.jpg');
INSERT INTO `images` VALUES (353, 54, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-cao-su-6.jpg');
INSERT INTO `images` VALUES (354, 54, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-cao-su-5.jpg');
INSERT INTO `images` VALUES (355, 54, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-go-cao-su-4.jpg');
INSERT INTO `images` VALUES (356, 54, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/60/ke-tivi-ktv68100-05.jpg');
INSERT INTO `images` VALUES (357, 55, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/63/ban-sofa-hien-dai-phong-khach-1.JPG');
INSERT INTO `images` VALUES (358, 55, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/63/ban-sofa-hien-dai-phong-khach-2.JPG');
INSERT INTO `images` VALUES (359, 55, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/63/ban-sofa-hien-dai-phong-khach-3.JPG');
INSERT INTO `images` VALUES (360, 55, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/63/ban-sofa-hien-dai-phong-khach-4.JPG');
INSERT INTO `images` VALUES (361, 56, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/2-ban-ben-sofa-phong-khach-5.jpg');
INSERT INTO `images` VALUES (362, 56, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/2-ban-ben-sofa-phong-khach-2.jpg');
INSERT INTO `images` VALUES (363, 56, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/2-ban-ben-sofa-phong-khach-3.jpg');
INSERT INTO `images` VALUES (364, 56, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/2-ban-ben-sofa-phong-khach-4.jpg');
INSERT INTO `images` VALUES (365, 57, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/6-ban-ben-sofa-mat-kinh-1.jpg');
INSERT INTO `images` VALUES (366, 57, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/6-ban-ben-sofa-mat-kinh-2.jpg');
INSERT INTO `images` VALUES (367, 57, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/6-ban-ben-sofa-mat-kinh-3.jpg');
INSERT INTO `images` VALUES (368, 57, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/64/6-ban-ben-sofa-mat-kinh-4.jpg');
INSERT INTO `images` VALUES (369, 58, 'https://homeoffice.com.vn/images/detailed/61/ban-ben-sofa-sst028-02.jpg');
INSERT INTO `images` VALUES (370, 58, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/61/ban-ben-sofa-sst028-04a.jpg');
INSERT INTO `images` VALUES (371, 58, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/61/ban-ben-sofa-sst028-05a.jpg');
INSERT INTO `images` VALUES (372, 58, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/61/ban-ben-sofa-sst028-06a.jpg');
INSERT INTO `images` VALUES (373, 59, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_tu_ke_ngan_05_2dddbd16595b4d7a86f94a3044090afb_master.png');
INSERT INTO `images` VALUES (374, 59, 'https://file.hstatic.net/200000065946/file/noi-that-moho-vienna-tu-quan-ao-1_d28e03515c9944a29e03442fc15c82d2.png');
INSERT INTO `images` VALUES (375, 59, 'https://file.hstatic.net/200000065946/file/noi-that-moho-vienna-tu-quan-ao_b98623033ae14b21be33b891e81fb58c.jpg');
INSERT INTO `images` VALUES (376, 59, 'https://file.hstatic.net/200000065946/file/noi-that-moho-vienna-tu-quan-ao-3_5c195b649bd849a68db5dba5527792c5.png');
INSERT INTO `images` VALUES (377, 60, 'https://product.hstatic.net/200000065946/product/pro_da_xanh_noi_that_moho_tu_da_nang_donica_1_2a09af4b07fc43a08453da29305a36ca_master.jpg');
INSERT INTO `images` VALUES (378, 60, 'https://product.hstatic.net/200000065946/product/pro_da_xanh_noi_that_moho_tu_da_nang_donica_3_87a2c03dd09e475198bc7db6815b5860_master.jpg');
INSERT INTO `images` VALUES (379, 60, 'https://product.hstatic.net/200000065946/product/pro_da_xanh_noi_that_moho_tu_da_nang_donica_4_bb8c0684f0404d2fa0202945cb5bd629_master.jpg');
INSERT INTO `images` VALUES (380, 60, 'https://product.hstatic.net/200000065946/product/pro_da_xanh_noi_that_moho_tu_da_nang_donica_5_2224ce6d1e7449788bf6398531cd9819_master.jpg');
INSERT INTO `images` VALUES (381, 61, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_7_ffdc000527be42ab83c75498e0bf9af4_master.jpg');
INSERT INTO `images` VALUES (382, 61, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_6_f2288dcbb3e9431883b06d419c3dd456_master.jpg');
INSERT INTO `images` VALUES (383, 61, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_1_bc25a12716e1480eabac144dabd0b711_master.jpg');
INSERT INTO `images` VALUES (384, 61, 'https://product.hstatic.net/200000065946/product/pro_cam_dat_noi_that_moho_tu_ke_tivi_go_odense_2_0cd00fe2f8cb415db120011fae7a570f_master.jpg');
INSERT INTO `images` VALUES (385, 62, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_1_eaa4c675e03f479d8eda5b9f5d43a221_master.jpg');
INSERT INTO `images` VALUES (386, 62, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_2_6c18907bbc3845ab98307cac8469e92b_master.jpg');
INSERT INTO `images` VALUES (387, 62, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_3_55bcec8724af48deb9ccdb0ab0c14502_master.jpg');
INSERT INTO `images` VALUES (388, 62, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_ke_tu_tivi_go_vline_301_4_a031b271dd194fd7b963234719872be2_master.jpg');
INSERT INTO `images` VALUES (389, 63, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_5_e2bdea792fd740efae89933464c62a01_master.jpg');
INSERT INTO `images` VALUES (390, 63, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_6_491c5f81437645cfb8741c3982495080_master.jpg');
INSERT INTO `images` VALUES (391, 63, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_2_ac704bcc97c54974afec890958855b6a_master.jpg');
INSERT INTO `images` VALUES (392, 63, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_ke_tivi_vline_3_6678353bb891475681648e781a630335_master.jpg');
INSERT INTO `images` VALUES (393, 64, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_malaga_11_5d5a9d11ac614b00946d60582f2c367d_master.jpg');
INSERT INTO `images` VALUES (394, 64, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_moho_malaga_4_188883249dc5408abbf4158284bc309e_master.jpg');
INSERT INTO `images` VALUES (395, 64, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_moho_malaga_5_6ebdb834dbc644d7af96cf6032c8c5e5_master.jpg');
INSERT INTO `images` VALUES (396, 64, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_go_malaga_13_4ad661651fbc4f28b946ecf7e55acafd_master.jpg');
INSERT INTO `images` VALUES (397, 65, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_1_9153ef95eb024e4ab35bbfce46902d47_master.jpg');
INSERT INTO `images` VALUES (398, 65, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_2_75a79e9e516a45979a9ed51731a56d11_master.jpg');
INSERT INTO `images` VALUES (399, 65, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_3_65b05cebc4bf49d79a15e04b9293bef4_master.jpg');
INSERT INTO `images` VALUES (400, 65, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_5_bf90559442e048daa82e49593219a93e_master.jpg');
INSERT INTO `images` VALUES (401, 66, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_fiji_6_35ad0c5d75404bb7ab1ace0a5b2571bf_master.jpg');
INSERT INTO `images` VALUES (402, 66, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_fiji_1_0572fbe2e7d74966bbcccba2e31329aa_master.jpg');
INSERT INTO `images` VALUES (403, 66, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_tu_dau_giuong_fiji_2_cd8882f880a841eeb9ade12a7abdd4a6_master.jpg');
INSERT INTO `images` VALUES (404, 66, 'https://product.hstatic.net/200000065946/product/pro_nau_tu_noi_that_moho_tu_dau_giuong_fiji_5_980014c29e2a4db7902efb8a0f458c1f_master.jpg');
INSERT INTO `images` VALUES (405, 67, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_11_7cac38416e714e32b8534fd2a8e011d8_master.jpg');
INSERT INTO `images` VALUES (406, 67, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_1_52509c767ef64b3289070b0a005a145d_master.jpg');
INSERT INTO `images` VALUES (407, 67, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_2_0d4f16923757400e8f65e4272c529188_master.jpg');
INSERT INTO `images` VALUES (408, 67, 'https://product.hstatic.net/200000065946/product/pro_trang_noi_that_moho_hoc_tu_luu_tru_4_56028c40c11f45c88cb846f9975901fb_master.jpg');
INSERT INTO `images` VALUES (409, 68, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_1_9153ef95eb024e4ab35bbfce46902d47_master.jpg');
INSERT INTO `images` VALUES (410, 68, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_2_75a79e9e516a45979a9ed51731a56d11_master.jpg');
INSERT INTO `images` VALUES (411, 68, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_4_d99eaad2d48047ca87462fa0664bed32_master.jpg');
INSERT INTO `images` VALUES (412, 68, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_dau_giuong_vline_5_bf90559442e048daa82e49593219a93e_master.jpg');
INSERT INTO `images` VALUES (413, 69, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_oslo_901_4_aa6deab03e374e7c8417afa33c8d70ec_master.jpg');
INSERT INTO `images` VALUES (414, 69, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_oslo_901_2_46f8d75c03874c44a7b81c160094dbfb_master.jpg');
INSERT INTO `images` VALUES (415, 69, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_oslo_901_6_d5d8283a4d2d45fc8e2ddcea285ab484_master.jpg');
INSERT INTO `images` VALUES (416, 69, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_tu_giay_oslo_901_9_1e725db265584edfbb465d2d139e63b3_master.jpg');
INSERT INTO `images` VALUES (417, 70, 'https://casani.vn/img/den-chum-hien-dai-cch-3743-15-6.jpg');
INSERT INTO `images` VALUES (418, 70, 'https://casani.vn/img/p/den-chum-hien-dai-cch-3743-15-p2727.jpg');
INSERT INTO `images` VALUES (419, 70, 'https://casani.vn/img/image/den-hien-dai/CCH-3743-15/CCH-3743-15-2.jpg');
INSERT INTO `images` VALUES (420, 70, 'https://casani.vn/img/den-chum-hien-dai-cch-3743-15-4.jpg');
INSERT INTO `images` VALUES (421, 71, 'https://casani.vn/img/p/den-chum-tha-hien-dai-cch-5620-12-p1346.jpg');
INSERT INTO `images` VALUES (422, 71, 'https://casani.vn/img/image/den-hien-dai/CCH-5620/CCH-5620-15-1.jpg');
INSERT INTO `images` VALUES (423, 71, 'https://casani.vn/img/image/den-hien-dai/CCH-5620/CCH-5620-15-3.jpg');
INSERT INTO `images` VALUES (424, 71, 'https://casani.vn/img/image/den-hien-dai/CCH-5620/CCH-5620-12-2.jpg');
INSERT INTO `images` VALUES (425, 72, 'https://casani.vn/img/p/den-tuong-hien-dai-cdt-2522-p944.jpg');
INSERT INTO `images` VALUES (426, 72, 'https://casani.vn/img/den-tuong-hien-dai-cdt-2522-1.jpg');
INSERT INTO `images` VALUES (427, 72, 'https://casani.vn/img/den-tuong-hien-dai-cdt-2522-2.jpg');
INSERT INTO `images` VALUES (428, 72, 'https://casani.vn/img/den-tuong-hien-dai-cdt-2522-3.jpg');
INSERT INTO `images` VALUES (429, 73, 'https://casani.vn/img/p/den-mam-pha-le-cmt1718-800-p896.jpg');
INSERT INTO `images` VALUES (430, 73, 'https://casani.vn/img/den-mam-pha-le-cmt1718-800.jpg');
INSERT INTO `images` VALUES (431, 73, 'https://casani.vn/img/den-mam-pha-le-cmt1718-800-3.jpg');
INSERT INTO `images` VALUES (432, 73, 'https://casani.vn/img/den-mam-pha-le-cmt1718-800-5.jpg');
INSERT INTO `images` VALUES (433, 74, 'https://casani.vn/img/p/den-mam-pha-le-ap-tran-mtk-103v-p4224.jpg');
INSERT INTO `images` VALUES (434, 74, 'https://casani.vn/img/image/den-mam/MTK-103V/Den-mam-pha-le-ap-tran-MTK-103V-2.jpg');
INSERT INTO `images` VALUES (435, 74, 'https://casani.vn/img/image/den-mam/MTK-103V/Den-mam-pha-le-ap-tran-MTK-103V-3.jpg');
INSERT INTO `images` VALUES (436, 74, 'https://casani.vn/img/image/den-mam/MTK-103V/Den-mam-pha-le-ap-tran-MTK-103V-4.jpg');
INSERT INTO `images` VALUES (437, 75, 'https://casani.vn/img/p/den-mam-op-tran-cho-be-cmb-1940-p2659.jpg');
INSERT INTO `images` VALUES (438, 76, 'https://casani.vn/img/p/den-chum-hien-dai-cch-3579-60-p3931.jpg');
INSERT INTO `images` VALUES (439, 76, 'https://casani.vn/img/den-chum-hien-dai-cch-3579-60-1.jpg');
INSERT INTO `images` VALUES (440, 76, 'https://casani.vn/img/den-chum-hien-dai-cch-3579-60-2.jpg');
INSERT INTO `images` VALUES (441, 76, 'https://casani.vn/img/den-chum-hien-dai-cch-3579-60-3.jpg');
INSERT INTO `images` VALUES (442, 77, 'https://casani.vn/img/p/den-chum-pha-le-hien-dai-cch-3621-60-p2535.jpg');
INSERT INTO `images` VALUES (443, 77, 'https://casani.vn/img/image/den-hien-dai/CCH-3621/CCH-3621-1.jpg');
INSERT INTO `images` VALUES (444, 77, 'https://casani.vn/img/image/den-hien-dai/CCH-3621/CCH-3621-2.jpg');
INSERT INTO `images` VALUES (445, 77, 'https://casani.vn/img/image/den-hien-dai/CCH-3621/CCH-3621-3.jpg');
INSERT INTO `images` VALUES (446, 78, 'https://casani.vn/img/p/den-tuong-hien-dai-cdt-2648-p2881.jpg');
INSERT INTO `images` VALUES (447, 78, 'https://casani.vn/img/den-tuong-hien-dai-cdt-2648-1.jpg');
INSERT INTO `images` VALUES (448, 78, 'https://casani.vn/img/den-tuong-hien-dai-cdt-2648-2.jpg');
INSERT INTO `images` VALUES (449, 78, 'https://casani.vn/img/den-tuong-hien-dai-cdt-2648-3.jpg');
INSERT INTO `images` VALUES (450, 79, 'https://flexhouse.vn/wp-content/uploads/2023/06/den-gan-tuong-hanh-lang-phong-cach-retro-zxl6836-5.jpg');
INSERT INTO `images` VALUES (451, 79, 'https://flexhouse.vn/wp-content/uploads/2023/06/den-gan-tuong-hanh-lang-phong-cach-retro-zxl6836-3.jpg');
INSERT INTO `images` VALUES (452, 79, 'https://flexhouse.vn/wp-content/uploads/2023/06/den-gan-tuong-hanh-lang-phong-cach-retro-zxl6836-2.jpg');
INSERT INTO `images` VALUES (453, 79, 'https://flexhouse.vn/wp-content/uploads/2023/06/den-gan-tuong-hanh-lang-phong-cach-retro-zxl6836-2.jpg');
INSERT INTO `images` VALUES (454, 80, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_malaga_302_12_b323fac7406b42e8bfc0f7dae9fa0861_master.jpg');
INSERT INTO `images` VALUES (455, 80, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_malaga_302_3_0f3d7c55f8d94aad9ad53c5cc442e024_master.png');
INSERT INTO `images` VALUES (456, 80, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_tram_malaga_302_11_be1c519e5149479abe8f9f4f2dfc9608_master.jpg');
INSERT INTO `images` VALUES (457, 80, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuo_ngu_malaga_302_1m2_1_49fc192023254e1591849c7f359b6d06_master.jpg');
INSERT INTO `images` VALUES (458, 81, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_6_33bb4e7536c548e1bfda6e56681d4c59_master.jpg');
INSERT INTO `images` VALUES (459, 81, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_4_27c446c413674272bfe5bc8b2089ed53_master.jpg');
INSERT INTO `images` VALUES (460, 81, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_soi_vline_601_1_1daec291c5f64366a95840adb11c703c_master.jpg');
INSERT INTO `images` VALUES (461, 81, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_vline_1m4_tam_phan_1_02d62e2195b14e978a4825559720349c_master.jpg');
INSERT INTO `images` VALUES (462, 82, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_go_nexo_5_f88ff1a1e1d94022b149e16db8175665_master.jpg');
INSERT INTO `images` VALUES (463, 82, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_go_nexo_6_761f5767164f45d69333610e6cf977a2_master.jpg');
INSERT INTO `images` VALUES (464, 82, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_go_nexo_1_d3a5521f1b054fe2a95a8b6a89287b81_master.jpg');
INSERT INTO `images` VALUES (465, 82, 'https://product.hstatic.net/200000065946/product/pro_1m6_noi_that_moho_giuong_ngu_go_nexo_3_ced4aef6a3d64eb492622959e50cd460_master.jpg');
INSERT INTO `images` VALUES (466, 83, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_boc_nem_skjeberg_1_5cd0f67c206c4b69b07a196c20ecc416_master.jpg');
INSERT INTO `images` VALUES (467, 83, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_boc_nem_skjeberg_2_0f247e59c16c4330ac11560305bf3bc2_master.jpg');
INSERT INTO `images` VALUES (468, 83, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_boc_nem_skjeberg_3_9af1f3db46b6403b9ab6f9f3983b8e6c_master.jpg');
INSERT INTO `images` VALUES (469, 83, 'https://product.hstatic.net/200000065946/product/pro_mau_tu_nhien_noi_that_moho_giuong_ngu_go_boc_nem_skjeberg_5_5fd69e7f6ae846e0b11ee351c678c794_master.jpg');
INSERT INTO `images` VALUES (470, 84, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_7_4d7fea1dcf184dbd89fe301f120e7020_master.jpg');
INSERT INTO `images` VALUES (471, 84, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_9_45ca39a5d0e44073a26b84786735a5b3_master.jpg');
INSERT INTO `images` VALUES (472, 84, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_8_f20a48a38100489985cc8d62f4a1ad0c_master.jpg');
INSERT INTO `images` VALUES (473, 84, 'https://product.hstatic.net/200000065946/product/pro_nau_noi_that_moho_giuong_ngu_go_hobro_12_4db959ebf42f4ae8bce8b9fc2fb34a79_master.jpg');
INSERT INTO `images` VALUES (474, 85, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-cum-2-kem-ke-4.JPG');
INSERT INTO `images` VALUES (475, 85, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-cum-2-kem-ke-1.JPG');
INSERT INTO `images` VALUES (476, 85, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-cum-2-kem-ke-6.JPG');
INSERT INTO `images` VALUES (477, 85, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-cum-2-kem-ke-7.JPG');
INSERT INTO `images` VALUES (478, 86, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-lam-viec-he-chan-oma-ii-go-cao-su.jpg');
INSERT INTO `images` VALUES (479, 86, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-lam-viec-he-chan-oma-ii-go-cao-su-1.jpg');
INSERT INTO `images` VALUES (480, 86, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-lam-viec-he-chan-oma-ii-go-cao-su-4.jpg');
INSERT INTO `images` VALUES (481, 86, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ban-lam-viec-he-chan-oma-ii-go-cao-su-6.jpg');
INSERT INTO `images` VALUES (482, 87, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-de-tai-lieu-van-phong-bang-go-10.jpg');
INSERT INTO `images` VALUES (483, 87, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-de-tai-lieu-van-phong-bang-go-11.jpg');
INSERT INTO `images` VALUES (484, 87, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-de-tai-lieu-van-phong-bang-go-12.jpg');
INSERT INTO `images` VALUES (485, 87, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/65/ke-de-tai-lieu-van-phong-bang-go-13.jpg');
INSERT INTO `images` VALUES (486, 88, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/55/ghe-chan-quy-lung-luoi-MFJ118-r02.jpg');
INSERT INTO `images` VALUES (487, 88, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/54/ghe-chan-quy-MFJ118-02.jpg');
INSERT INTO `images` VALUES (488, 88, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/55/ghe-chan-quy-lung-luoi-MFJ118-r02.jpg');
INSERT INTO `images` VALUES (489, 88, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/55/ghe-chan-quy-lung-luoi-MFJ118-r04.jpg');
INSERT INTO `images` VALUES (490, 89, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-cong-thai-hoc-lung-luoi-cao-cap-1a.jpg');
INSERT INTO `images` VALUES (491, 89, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-cong-thai-hoc-lung-luoi-cao-cap-2.jpg');
INSERT INTO `images` VALUES (492, 89, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-cong-thai-hoc-lung-luoi-cao-cap-3.jpg');
INSERT INTO `images` VALUES (493, 89, 'https://homeoffice.com.vn/images/thumbnails/640/640/detailed/67/ghe-cong-thai-hoc-lung-luoi-cao-cap-5.jpg');

-- ----------------------------
-- Table structure for import_products
-- ----------------------------
DROP TABLE IF EXISTS `import_products`;
CREATE TABLE `import_products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `distributor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `imp_p`(`product_id` ASC) USING BTREE,
  INDEX `imp_u`(`user_name` ASC) USING BTREE,
  CONSTRAINT `imp_p` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `imp_u` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of import_products
-- ----------------------------
INSERT INTO `import_products` VALUES (26, 1, 'dung4', 10, '2023-05-06 12:15:10', NULL);
INSERT INTO `import_products` VALUES (27, 6, 'dung4', 10, '2023-05-06 12:15:10', NULL);
INSERT INTO `import_products` VALUES (28, 6, 'dung4', 2, '2023-05-06 12:52:56', NULL);
INSERT INTO `import_products` VALUES (29, 8, 'dung4', 3, '2023-05-06 12:52:56', NULL);
INSERT INTO `import_products` VALUES (30, 1, 'dung4', 2, '2023-05-31 15:26:34', NULL);
INSERT INTO `import_products` VALUES (31, 1, 'dung4', 2, '2023-05-31 15:44:49', NULL);
INSERT INTO `import_products` VALUES (32, 1, 'dung4', 2, '2023-05-31 15:53:51', NULL);
INSERT INTO `import_products` VALUES (33, 1, 'dung4', 3, '2023-05-31 15:59:15', NULL);
INSERT INTO `import_products` VALUES (34, 1, 'dung4', 7, '2023-05-31 22:31:51', NULL);
INSERT INTO `import_products` VALUES (35, 1, 'dung4', 2, '2023-05-31 22:33:14', NULL);
INSERT INTO `import_products` VALUES (36, 1, 'dung4', 4, '2023-05-31 22:35:54', NULL);
INSERT INTO `import_products` VALUES (37, 1, 'dung4', 3, '2023-05-31 22:38:41', NULL);
INSERT INTO `import_products` VALUES (38, 1, 'dung4', 2, '2023-05-31 23:17:46', NULL);
INSERT INTO `import_products` VALUES (39, 1, 'dung4', 3, '2023-05-31 23:22:41', NULL);
INSERT INTO `import_products` VALUES (46, 1, 'dung4', 2, '2023-05-31 23:24:56', NULL);
INSERT INTO `import_products` VALUES (47, 1, 'dung4', 2, '2023-05-31 23:26:26', NULL);
INSERT INTO `import_products` VALUES (48, 1, 'dung4', 2, '2023-05-31 23:28:35', NULL);
INSERT INTO `import_products` VALUES (49, 2, 'huyen', 10, '2023-06-15 22:46:02', NULL);
INSERT INTO `import_products` VALUES (50, 42, 'huyen', 5, '2023-06-21 13:07:41', NULL);

-- ----------------------------
-- Table structure for introduce
-- ----------------------------
DROP TABLE IF EXISTS `introduce`;
CREATE TABLE `introduce`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `introduce` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `showroom` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `timework` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `caption` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of introduce
-- ----------------------------
INSERT INTO `introduce` VALUES (1, 'NỘI THẤT HAPPYHOME', 'Nội Thất HAPPYHOME là thương hiệu đến từ Việt Nam với hơn 35 năm kinh nghiệm trong việc sản xuất và xuất khẩu nội thất đạt chuẩn quốc tế..', 'Khu phố 6, phường Linh Trung,Thành phố Thủ Đức,Thành phố Hồ Chí Minh, Việt Nam', 'Đại Học Nông Lâm TP.HCM', 'Từ 8:00 đến 21:00 mọi ngày trừ ngày lễ.', 'contact@happyhome.com', '0867155409', '“ Chân thành cảm ơn quý khách đã lựa chọn và tin tưởng ủng hộ những sản phẩm của chúng tôi trong suốt thời gian vừa qua. Trong quá trình sử dụng hoặc mua sắm nếu có thắc mắc hay phản ánh về chất lượng, quý khách hãy để lại phản ánh hoặc câu hỏi cho chúng tôi.”');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` tinyint NOT NULL,
  `user` int NOT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL,
  `ipAddress` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1319 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1288, 0, 11, 'List-User', '[UserModel{id=11, userName=\'huyen\', passWord=\'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\', role=1, fullName=\'Nlu\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'nữ\', enable=1, num_log_in=0}\n, UserModel{id=13, userName=\'dung\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=25, userName=\'dung4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'KTX khu B ĐHQG, Đông Hòa, Dĩ An, Bình Dương\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=26, userName=\'dung6\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=30, userName=\'t4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test4\', phoneNum=\'null\', email=\'test@gmail.com\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=34, userName=\'t8\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=35, userName=\'t9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=38, userName=\'t12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'ảo thật đấy\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=2, num_log_in=0}\n, UserModel{id=40, userName=\'t14\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=54, userName=\'dung2\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=55, userName=\'dung12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=56, userName=\'test1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=57, userName=\'admin\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'admin\', phoneNum=\'0333027154\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=58, userName=\'datt\', passWord=\'f0fce59379cc3c4e9e99a848f03e650373c1d6e62ae1a05644c86f8c6e502b9a\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'0867155409\', email=\'ngthanh.dat1305@gmail.com\', address=\'Thủ Đức\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=59, userName=\'Nguyễn Thành Đạt\', passWord=\'b7a8240da0e4ee5e13794fbd7bacc168023592f17ea7830bae67e981c1ffd66d\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=60, userName=\'Lê Dũng\', passWord=\'1ec7c8606082177a116b3ea4446307eaa3d8936dd4f3da545fca6af8d7665ceb\', role=0, fullName=\'Lê Dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=61, userName=\'Thành Đạt Nguyễn\', passWord=\'71af45ad57e9219e5dd1260d70617a0e149e30fa75938127205eac83ed9b3909\', role=0, fullName=\'Thành Đạt Nguyễn\', phoneNum=\'null\', email=\'ngthanh.dat1305@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=62, userName=\'ga la\', passWord=\'6bbc041675ca2df05887663d68e0162c285ce348fc9c7a3f6f09fc113ffd2bf2\', role=0, fullName=\'ga la\', phoneNum=\'null\', email=\'laga2134@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=63, userName=\'dung5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=64, userName=\'usertest\', passWord=\'c015bc9b6d57b9f1ca4fa1e2eaec1722f076c8a698476403b202d3db5edf6438\', role=0, fullName=\'Nguyễn Văn A\', phoneNum=\'null\', email=\'kieudiem.to2006@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=65, userName=\'test5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test5\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=66, userName=\'test9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test9\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=67, userName=\'testt1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=68, userName=\'test10\', passWord=\'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3\', role=0, fullName=\'test10\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=69, userName=\'tmdt2024\', passWord=\'ed0d841fe3e187be315ff6d45c116d9271b5e1c713f541005998e93feeca552c\', role=0, fullName=\'Thương mại điện tử\', phoneNum=\'0123456789\', email=\'rivasvow@gmail.com\', address=\'Đại học Nông Lâm\', gender=\'nam\', enable=1, num_log_in=0}\n]', '2024-03-20 21:15:04', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1289, 0, 11, 'List-User', '{\"draw\":2,\"recordsTotal\":25,\"recordsFiltered\":25,\"data\":[null,null,null,null,null,null,null,null,null,null]}', '2024-03-20 21:15:04', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1290, 0, 11, 'AUTH  USER LOGIN SUCCESS', ' USER LOGIN SUCCESS: User - huyen', '2024-03-20 21:18:15', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1291, 0, 11, 'List-User', '[UserModel{id=11, userName=\'huyen\', passWord=\'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\', role=1, fullName=\'Nlu\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'nữ\', enable=1, num_log_in=0}\n, UserModel{id=13, userName=\'dung\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=25, userName=\'dung4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'KTX khu B ĐHQG, Đông Hòa, Dĩ An, Bình Dương\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=26, userName=\'dung6\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=30, userName=\'t4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test4\', phoneNum=\'null\', email=\'test@gmail.com\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=34, userName=\'t8\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=35, userName=\'t9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=38, userName=\'t12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'ảo thật đấy\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=2, num_log_in=0}\n, UserModel{id=40, userName=\'t14\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=54, userName=\'dung2\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=55, userName=\'dung12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=56, userName=\'test1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=57, userName=\'admin\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'admin\', phoneNum=\'0333027154\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=58, userName=\'datt\', passWord=\'f0fce59379cc3c4e9e99a848f03e650373c1d6e62ae1a05644c86f8c6e502b9a\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'0867155409\', email=\'ngthanh.dat1305@gmail.com\', address=\'Thủ Đức\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=59, userName=\'Nguyễn Thành Đạt\', passWord=\'b7a8240da0e4ee5e13794fbd7bacc168023592f17ea7830bae67e981c1ffd66d\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=60, userName=\'Lê Dũng\', passWord=\'1ec7c8606082177a116b3ea4446307eaa3d8936dd4f3da545fca6af8d7665ceb\', role=0, fullName=\'Lê Dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=61, userName=\'Thành Đạt Nguyễn\', passWord=\'71af45ad57e9219e5dd1260d70617a0e149e30fa75938127205eac83ed9b3909\', role=0, fullName=\'Thành Đạt Nguyễn\', phoneNum=\'null\', email=\'ngthanh.dat1305@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=62, userName=\'ga la\', passWord=\'6bbc041675ca2df05887663d68e0162c285ce348fc9c7a3f6f09fc113ffd2bf2\', role=0, fullName=\'ga la\', phoneNum=\'null\', email=\'laga2134@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=63, userName=\'dung5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=64, userName=\'usertest\', passWord=\'c015bc9b6d57b9f1ca4fa1e2eaec1722f076c8a698476403b202d3db5edf6438\', role=0, fullName=\'Nguyễn Văn A\', phoneNum=\'null\', email=\'kieudiem.to2006@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=65, userName=\'test5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test5\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=66, userName=\'test9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test9\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=67, userName=\'testt1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=68, userName=\'test10\', passWord=\'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3\', role=0, fullName=\'test10\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=69, userName=\'tmdt2024\', passWord=\'ed0d841fe3e187be315ff6d45c116d9271b5e1c713f541005998e93feeca552c\', role=0, fullName=\'Thương mại điện tử\', phoneNum=\'0123456789\', email=\'rivasvow@gmail.com\', address=\'Đại học Nông Lâm\', gender=\'nam\', enable=1, num_log_in=0}\n]', '2024-03-20 21:18:34', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1292, 0, 11, 'List-User', '{\"draw\":2,\"recordsTotal\":25,\"recordsFiltered\":25,\"data\":[null,null,null,null,null,null,null,null,null,null]}', '2024-03-20 21:18:35', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1293, 0, 11, 'List-User', '{\"draw\":2,\"recordsTotal\":25,\"recordsFiltered\":25,\"data\":[null,null,null,null,null,null,null,null,null,null]}', '2024-03-20 21:19:05', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1294, 0, 11, 'List-User', '{\"draw\":2,\"recordsTotal\":25,\"recordsFiltered\":25,\"data\":[null,null,null,null,null,null,null,null,null,null]}', '2024-03-20 21:19:09', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1295, 0, 11, 'AUTH  USER LOGIN SUCCESS', ' USER LOGIN SUCCESS: User - huyen', '2024-03-20 21:25:43', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1296, 0, 11, 'List-User', '[UserModel{id=11, userName=\'huyen\', passWord=\'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\', role=1, fullName=\'Nlu\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'nữ\', enable=1, num_log_in=0}\n, UserModel{id=13, userName=\'dung\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=25, userName=\'dung4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'KTX khu B ĐHQG, Đông Hòa, Dĩ An, Bình Dương\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=26, userName=\'dung6\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=30, userName=\'t4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test4\', phoneNum=\'null\', email=\'test@gmail.com\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=34, userName=\'t8\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=35, userName=\'t9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=38, userName=\'t12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'ảo thật đấy\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=2, num_log_in=0}\n, UserModel{id=40, userName=\'t14\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=54, userName=\'dung2\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=55, userName=\'dung12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=56, userName=\'test1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=57, userName=\'admin\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'admin\', phoneNum=\'0333027154\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=58, userName=\'datt\', passWord=\'f0fce59379cc3c4e9e99a848f03e650373c1d6e62ae1a05644c86f8c6e502b9a\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'0867155409\', email=\'ngthanh.dat1305@gmail.com\', address=\'Thủ Đức\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=59, userName=\'Nguyễn Thành Đạt\', passWord=\'b7a8240da0e4ee5e13794fbd7bacc168023592f17ea7830bae67e981c1ffd66d\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=60, userName=\'Lê Dũng\', passWord=\'1ec7c8606082177a116b3ea4446307eaa3d8936dd4f3da545fca6af8d7665ceb\', role=0, fullName=\'Lê Dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=61, userName=\'Thành Đạt Nguyễn\', passWord=\'71af45ad57e9219e5dd1260d70617a0e149e30fa75938127205eac83ed9b3909\', role=0, fullName=\'Thành Đạt Nguyễn\', phoneNum=\'null\', email=\'ngthanh.dat1305@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=62, userName=\'ga la\', passWord=\'6bbc041675ca2df05887663d68e0162c285ce348fc9c7a3f6f09fc113ffd2bf2\', role=0, fullName=\'ga la\', phoneNum=\'null\', email=\'laga2134@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=63, userName=\'dung5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=64, userName=\'usertest\', passWord=\'c015bc9b6d57b9f1ca4fa1e2eaec1722f076c8a698476403b202d3db5edf6438\', role=0, fullName=\'Nguyễn Văn A\', phoneNum=\'null\', email=\'kieudiem.to2006@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=65, userName=\'test5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test5\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=66, userName=\'test9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test9\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=67, userName=\'testt1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=68, userName=\'test10\', passWord=\'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3\', role=0, fullName=\'test10\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=69, userName=\'tmdt2024\', passWord=\'ed0d841fe3e187be315ff6d45c116d9271b5e1c713f541005998e93feeca552c\', role=0, fullName=\'Thương mại điện tử\', phoneNum=\'0123456789\', email=\'rivasvow@gmail.com\', address=\'Đại học Nông Lâm\', gender=\'nam\', enable=1, num_log_in=0}\n]', '2024-03-20 21:25:46', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1297, 0, 11, 'List-User', '{\"draw\":2,\"recordsTotal\":3,\"recordsFiltered\":3,\"data\":[{\"id\":11,\"ids\":null,\"idPms\":null,\"userName\":\"huyen\",\"passWord\":\"5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\",\"role\":1,\"fullName\":\"Nlu\",\"phoneNum\":null,\"email\":\"20130013@st.hcmuaf.edu.vn\",\"address\":null,\"gender\":\"nữ\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":13,\"ids\":null,\"idPms\":null,\"userName\":\"dung\",\"passWord\":\"dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\",\"role\":1,\"fullName\":\"lê đình quốc dũng\",\"phoneNum\":null,\"email\":\"quocdungledinh@gmail.com\",\"address\":null,\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":57,\"ids\":null,\"idPms\":null,\"userName\":\"admin\",\"passWord\":\"dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\",\"role\":1,\"fullName\":\"admin\",\"phoneNum\":\"0333027154\",\"email\":\"quocdungledinh@gmail.com\",\"address\":null,\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"}]}', '2024-03-20 21:25:47', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1298, 0, 11, 'AUTH  USER LOGIN SUCCESS', ' USER LOGIN SUCCESS: User - huyen', '2024-03-20 21:53:44', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1299, 0, 11, 'List-User', '[UserModel{id=11, userName=\'huyen\', passWord=\'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\', role=1, fullName=\'Nlu\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'nữ\', enable=1, num_log_in=0}\n, UserModel{id=13, userName=\'dung\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=25, userName=\'dung4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'KTX khu B ĐHQG, Đông Hòa, Dĩ An, Bình Dương\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=26, userName=\'dung6\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=30, userName=\'t4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test4\', phoneNum=\'null\', email=\'test@gmail.com\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=34, userName=\'t8\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=35, userName=\'t9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=38, userName=\'t12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'ảo thật đấy\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=2, num_log_in=0}\n, UserModel{id=40, userName=\'t14\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=54, userName=\'dung2\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=55, userName=\'dung12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=56, userName=\'test1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=57, userName=\'admin\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'admin\', phoneNum=\'0333027154\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=58, userName=\'datt\', passWord=\'f0fce59379cc3c4e9e99a848f03e650373c1d6e62ae1a05644c86f8c6e502b9a\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'0867155409\', email=\'ngthanh.dat1305@gmail.com\', address=\'Thủ Đức\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=59, userName=\'Nguyễn Thành Đạt\', passWord=\'b7a8240da0e4ee5e13794fbd7bacc168023592f17ea7830bae67e981c1ffd66d\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=60, userName=\'Lê Dũng\', passWord=\'1ec7c8606082177a116b3ea4446307eaa3d8936dd4f3da545fca6af8d7665ceb\', role=0, fullName=\'Lê Dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=61, userName=\'Thành Đạt Nguyễn\', passWord=\'71af45ad57e9219e5dd1260d70617a0e149e30fa75938127205eac83ed9b3909\', role=0, fullName=\'Thành Đạt Nguyễn\', phoneNum=\'null\', email=\'ngthanh.dat1305@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=62, userName=\'ga la\', passWord=\'6bbc041675ca2df05887663d68e0162c285ce348fc9c7a3f6f09fc113ffd2bf2\', role=0, fullName=\'ga la\', phoneNum=\'null\', email=\'laga2134@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=63, userName=\'dung5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=64, userName=\'usertest\', passWord=\'c015bc9b6d57b9f1ca4fa1e2eaec1722f076c8a698476403b202d3db5edf6438\', role=0, fullName=\'Nguyễn Văn A\', phoneNum=\'null\', email=\'kieudiem.to2006@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=65, userName=\'test5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test5\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=66, userName=\'test9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test9\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=67, userName=\'testt1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=68, userName=\'test10\', passWord=\'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3\', role=0, fullName=\'test10\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=69, userName=\'tmdt2024\', passWord=\'ed0d841fe3e187be315ff6d45c116d9271b5e1c713f541005998e93feeca552c\', role=0, fullName=\'Thương mại điện tử\', phoneNum=\'0123456789\', email=\'rivasvow@gmail.com\', address=\'Đại học Nông Lâm\', gender=\'nam\', enable=1, num_log_in=0}\n]', '2024-03-20 21:53:48', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1300, 0, 11, 'List-User', '{\"draw\":2,\"recordsTotal\":3,\"recordsFiltered\":3,\"data\":[{\"id\":11,\"ids\":null,\"idPms\":null,\"userName\":\"huyen\",\"passWord\":\"5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\",\"role\":1,\"fullName\":\"Nlu\",\"phoneNum\":null,\"email\":\"20130013@st.hcmuaf.edu.vn\",\"address\":null,\"gender\":\"nữ\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":13,\"ids\":null,\"idPms\":null,\"userName\":\"dung\",\"passWord\":\"dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\",\"role\":1,\"fullName\":\"lê đình quốc dũng\",\"phoneNum\":null,\"email\":\"quocdungledinh@gmail.com\",\"address\":null,\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":57,\"ids\":null,\"idPms\":null,\"userName\":\"admin\",\"passWord\":\"dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\",\"role\":1,\"fullName\":\"admin\",\"phoneNum\":\"0333027154\",\"email\":\"quocdungledinh@gmail.com\",\"address\":null,\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"}]}', '2024-03-20 21:53:48', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1301, 0, 11, 'List-invoice', '[Order{oder_id=12, user_name=\'dung4\', total_money=5990000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'269:2264:80213\', note=\'\'}, Order{oder_id=13, user_name=\'dung4\', total_money=899000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'264:2017:70708\', note=\'\'}, Order{oder_id=14, user_name=\'dung4\', total_money=5990000, fee=912000, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'262:3279:370814\', note=\'\'}, Order{oder_id=15, user_name=\'dung4\', total_money=1290000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'265:2179:621014\', note=\'\'}, Order{oder_id=16, user_name=\'dung4\', total_money=1990000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'265:2170:620905\', note=\'\'}, Order{oder_id=17, user_name=\'dung4\', total_money=5990000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'268:2046:220908\', note=\'\'}, Order{oder_id=18, user_name=\'dung4\', total_money=1290000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'267:2156:230528\', note=\'\'}, Order{oder_id=19, user_name=\'dung4\', total_money=1290000, fee=1580500, date_order=2023-05-15, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'267:2156:230522\', note=\'\'}, Order{oder_id=20, user_name=\'datt\', total_money=11215000, fee=912000, date_order=2023-06-12, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh\', note=\'Giao hàng nhanh\'}, Order{oder_id=21, user_name=\'Nguyễn Thành Đạt\', total_money=4990000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh\', note=\'Ok\'}, Order{oder_id=22, user_name=\'Nguyễn Thành Đạt\', total_money=5990000, fee=674500, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh\', note=\'ok\'}, Order{oder_id=23, user_name=\'huyen\', total_money=176000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'258:1779:470702\', status=2, address=\'Xã Ea H\'leo, Huyện Ea H leo, Đắk Lắk\', note=\'Ok shop\'}, Order{oder_id=24, user_name=\'huyen\', total_money=1290000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'258:1779:470702\', status=2, address=\'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận\', note=\'ok\'}, Order{oder_id=25, user_name=\'datt\', total_money=899000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'258:1779:470702\', status=2, address=\'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận\', note=\'Test\'}, Order{oder_id=26, user_name=\'datt\', total_money=1290000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'258:1779:470702\', status=2, address=\'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận\', note=\'fix\'}, Order{oder_id=27, user_name=\'huyen\', total_money=1290000, fee=912000, date_order=2023-06-17, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Xã Phú Cường, Huyện Cai Lậy, Tiền Giang\', note=\'\'}, Order{oder_id=28, user_name=\'dung4\', total_money=176000, fee=1580500, date_order=2023-06-20, payment=\'Giao hàng thu tiền tận nhà\', transport=\'268:2194:220708\', status=2, address=\'Xã Nhật Quang, Huyện Phù Cừ, Hưng Yên\', note=\'\'}, Order{oder_id=29, user_name=\'dung4\', total_money=176000, fee=1580500, date_order=2023-06-20, payment=\'Giao hàng thu tiền tận nhà\', transport=\'266:2204:140210\', status=2, address=\'Xã Nậm ét, Huyện Quỳnh Nhai, Sơn La\', note=\'\'}, Order{oder_id=30, user_name=\'Nguyễn Thành Đạt\', total_money=3870000, fee=912000, date_order=2023-06-20, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Xã Phú Cường, Huyện Cai Lậy, Tiền Giang\', note=\'Giao hàng nhanh\'}, Order{oder_id=31, user_name=\'usertest\', total_money=3580000, fee=674500, date_order=2023-06-21, payment=\'Giao hàng thu tiền tận nhà\', transport=\'202:3695:90737\', status=0, address=\'Phường Linh Trung, Thành Phố Thủ Đức, Hồ Chí Minh\', note=\'Giao hàng vào buổi trưa nhé shop\'}, Order{oder_id=32, user_name=\'Nguyễn Thành Đạt\', total_money=176000, fee=0, date_order=2024-03-20, payment=\'Nhận hàng tại cửa hàng\', transport=\'216:3155:501112\', status=0, address=\'Xã Tân Phú Trung, Huyện Châu Thành, Đồng Tháp\', note=\'\'}]', '2024-03-20 21:53:52', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1302, 0, 11, 'Order-Detail', 'Order{oder_id=32, user_name=\'Nguyễn Thành Đạt\', total_money=176000, fee=0, date_order=2024-03-20, payment=\'Nhận hàng tại cửa hàng\', transport=\'216:3155:501112\', status=0, address=\'Xã Tân Phú Trung, Huyện Châu Thành, Đồng Tháp\', note=\'\'}', '2024-03-20 21:53:56', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1303, 0, 11, 'List-invoice', '[Order{oder_id=12, user_name=\'dung4\', total_money=5990000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'269:2264:80213\', note=\'\'}, Order{oder_id=13, user_name=\'dung4\', total_money=899000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'264:2017:70708\', note=\'\'}, Order{oder_id=14, user_name=\'dung4\', total_money=5990000, fee=912000, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'262:3279:370814\', note=\'\'}, Order{oder_id=15, user_name=\'dung4\', total_money=1290000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'265:2179:621014\', note=\'\'}, Order{oder_id=16, user_name=\'dung4\', total_money=1990000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'265:2170:620905\', note=\'\'}, Order{oder_id=17, user_name=\'dung4\', total_money=5990000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'268:2046:220908\', note=\'\'}, Order{oder_id=18, user_name=\'dung4\', total_money=1290000, fee=1580500, date_order=2023-05-04, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'267:2156:230528\', note=\'\'}, Order{oder_id=19, user_name=\'dung4\', total_money=1290000, fee=1580500, date_order=2023-05-15, payment=\'Giao hàng thu tiền tận nhà\', transport=\'API\', status=2, address=\'267:2156:230522\', note=\'\'}, Order{oder_id=20, user_name=\'datt\', total_money=11215000, fee=912000, date_order=2023-06-12, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh\', note=\'Giao hàng nhanh\'}, Order{oder_id=21, user_name=\'Nguyễn Thành Đạt\', total_money=4990000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh\', note=\'Ok\'}, Order{oder_id=22, user_name=\'Nguyễn Thành Đạt\', total_money=5990000, fee=674500, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh\', note=\'ok\'}, Order{oder_id=23, user_name=\'huyen\', total_money=176000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'258:1779:470702\', status=2, address=\'Xã Ea H\'leo, Huyện Ea H leo, Đắk Lắk\', note=\'Ok shop\'}, Order{oder_id=24, user_name=\'huyen\', total_money=1290000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'258:1779:470702\', status=2, address=\'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận\', note=\'ok\'}, Order{oder_id=25, user_name=\'datt\', total_money=899000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'258:1779:470702\', status=2, address=\'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận\', note=\'Test\'}, Order{oder_id=26, user_name=\'datt\', total_money=1290000, fee=912000, date_order=2023-06-13, payment=\'Giao hàng thu tiền tận nhà\', transport=\'258:1779:470702\', status=2, address=\'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận\', note=\'fix\'}, Order{oder_id=27, user_name=\'huyen\', total_money=1290000, fee=912000, date_order=2023-06-17, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Xã Phú Cường, Huyện Cai Lậy, Tiền Giang\', note=\'\'}, Order{oder_id=28, user_name=\'dung4\', total_money=176000, fee=1580500, date_order=2023-06-20, payment=\'Giao hàng thu tiền tận nhà\', transport=\'268:2194:220708\', status=2, address=\'Xã Nhật Quang, Huyện Phù Cừ, Hưng Yên\', note=\'\'}, Order{oder_id=29, user_name=\'dung4\', total_money=176000, fee=1580500, date_order=2023-06-20, payment=\'Giao hàng thu tiền tận nhà\', transport=\'266:2204:140210\', status=2, address=\'Xã Nậm ét, Huyện Quỳnh Nhai, Sơn La\', note=\'\'}, Order{oder_id=30, user_name=\'Nguyễn Thành Đạt\', total_money=3870000, fee=912000, date_order=2023-06-20, payment=\'Giao hàng thu tiền tận nhà\', transport=\'212:2084:530412\', status=2, address=\'Xã Phú Cường, Huyện Cai Lậy, Tiền Giang\', note=\'Giao hàng nhanh\'}, Order{oder_id=31, user_name=\'usertest\', total_money=3580000, fee=674500, date_order=2023-06-21, payment=\'Giao hàng thu tiền tận nhà\', transport=\'202:3695:90737\', status=0, address=\'Phường Linh Trung, Thành Phố Thủ Đức, Hồ Chí Minh\', note=\'Giao hàng vào buổi trưa nhé shop\'}, Order{oder_id=32, user_name=\'Nguyễn Thành Đạt\', total_money=176000, fee=0, date_order=2024-03-20, payment=\'Nhận hàng tại cửa hàng\', transport=\'216:3155:501112\', status=0, address=\'Xã Tân Phú Trung, Huyện Châu Thành, Đồng Tháp\', note=\'\'}]', '2024-03-20 21:54:08', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1304, 2, -1, 'AUTH USER LOGIN D0 NOT HAVE ACCESS', ' USER LOGIN D0 NOT HAVE ACCESS: User - tmdt2024', '2024-03-20 21:59:25', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1305, 2, -1, 'AUTH USER LOGIN D0 NOT HAVE ACCESS', ' USER LOGIN D0 NOT HAVE ACCESS: User - datt', '2024-03-20 21:59:31', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1306, 2, -1, 'AUTH USER LOGIN D0 NOT HAVE ACCESS', ' USER LOGIN D0 NOT HAVE ACCESS: User - datt', '2024-03-20 21:59:38', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1307, 2, -1, 'AUTH USER LOGIN D0 NOT HAVE ACCESS', ' USER LOGIN D0 NOT HAVE ACCESS: User - datt', '2024-03-20 21:59:43', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1308, 0, 11, 'AUTH  USER LOGIN SUCCESS', ' USER LOGIN SUCCESS: User - huyen', '2024-03-20 21:59:47', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1309, 0, 11, 'List-User', '[UserModel{id=11, userName=\'huyen\', passWord=\'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\', role=1, fullName=\'Nlu\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'nữ\', enable=1, num_log_in=0}\n, UserModel{id=13, userName=\'dung\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=25, userName=\'dung4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'KTX khu B ĐHQG, Đông Hòa, Dĩ An, Bình Dương\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=26, userName=\'dung6\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=30, userName=\'t4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test4\', phoneNum=\'null\', email=\'test@gmail.com\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=34, userName=\'t8\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=35, userName=\'t9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=38, userName=\'t12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'ảo thật đấy\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=2, num_log_in=0}\n, UserModel{id=40, userName=\'t14\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=54, userName=\'dung2\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=55, userName=\'dung12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=56, userName=\'test1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=57, userName=\'admin\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'admin\', phoneNum=\'0333027154\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=58, userName=\'datt\', passWord=\'f0fce59379cc3c4e9e99a848f03e650373c1d6e62ae1a05644c86f8c6e502b9a\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'0867155409\', email=\'ngthanh.dat1305@gmail.com\', address=\'Thủ Đức\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=59, userName=\'Nguyễn Thành Đạt\', passWord=\'b7a8240da0e4ee5e13794fbd7bacc168023592f17ea7830bae67e981c1ffd66d\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=60, userName=\'Lê Dũng\', passWord=\'1ec7c8606082177a116b3ea4446307eaa3d8936dd4f3da545fca6af8d7665ceb\', role=0, fullName=\'Lê Dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=61, userName=\'Thành Đạt Nguyễn\', passWord=\'71af45ad57e9219e5dd1260d70617a0e149e30fa75938127205eac83ed9b3909\', role=0, fullName=\'Thành Đạt Nguyễn\', phoneNum=\'null\', email=\'ngthanh.dat1305@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=62, userName=\'ga la\', passWord=\'6bbc041675ca2df05887663d68e0162c285ce348fc9c7a3f6f09fc113ffd2bf2\', role=0, fullName=\'ga la\', phoneNum=\'null\', email=\'laga2134@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=63, userName=\'dung5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=64, userName=\'usertest\', passWord=\'c015bc9b6d57b9f1ca4fa1e2eaec1722f076c8a698476403b202d3db5edf6438\', role=0, fullName=\'Nguyễn Văn A\', phoneNum=\'null\', email=\'kieudiem.to2006@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=65, userName=\'test5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test5\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=66, userName=\'test9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test9\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=67, userName=\'testt1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=68, userName=\'test10\', passWord=\'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3\', role=0, fullName=\'test10\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=69, userName=\'tmdt2024\', passWord=\'ed0d841fe3e187be315ff6d45c116d9271b5e1c713f541005998e93feeca552c\', role=0, fullName=\'Thương mại điện tử\', phoneNum=\'0123456789\', email=\'rivasvow@gmail.com\', address=\'Đại học Nông Lâm\', gender=\'nam\', enable=1, num_log_in=0}\n]', '2024-03-20 21:59:51', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1310, 0, 11, 'List-User', '{\"draw\":2,\"recordsTotal\":3,\"recordsFiltered\":3,\"data\":[{\"id\":11,\"ids\":null,\"idPms\":null,\"userName\":\"huyen\",\"passWord\":\"5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\",\"role\":1,\"fullName\":\"Nlu\",\"phoneNum\":null,\"email\":\"20130013@st.hcmuaf.edu.vn\",\"address\":null,\"gender\":\"nữ\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":13,\"ids\":null,\"idPms\":null,\"userName\":\"dung\",\"passWord\":\"dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\",\"role\":1,\"fullName\":\"lê đình quốc dũng\",\"phoneNum\":null,\"email\":\"quocdungledinh@gmail.com\",\"address\":null,\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":57,\"ids\":null,\"idPms\":null,\"userName\":\"admin\",\"passWord\":\"dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\",\"role\":1,\"fullName\":\"admin\",\"phoneNum\":\"0333027154\",\"email\":\"quocdungledinh@gmail.com\",\"address\":null,\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"}]}', '2024-03-20 21:59:52', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1311, 0, 11, 'List-User', '[UserModel{id=11, userName=\'huyen\', passWord=\'5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\', role=1, fullName=\'Nlu\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'nữ\', enable=1, num_log_in=0}\n, UserModel{id=13, userName=\'dung\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=25, userName=\'dung4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'KTX khu B ĐHQG, Đông Hòa, Dĩ An, Bình Dương\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=26, userName=\'dung6\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=30, userName=\'t4\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test4\', phoneNum=\'null\', email=\'test@gmail.com\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=34, userName=\'t8\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=35, userName=\'t9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'0\', address=\'null\', gender=\'null\', enable=1, num_log_in=0}\n, UserModel{id=38, userName=\'t12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'ảo thật đấy\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=2, num_log_in=0}\n, UserModel{id=40, userName=\'t14\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'null\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=54, userName=\'dung2\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=55, userName=\'dung12\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'0355806119\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=56, userName=\'test1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'\', email=\'quocdungledinh@gmail.com\', address=\'\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=57, userName=\'admin\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=1, fullName=\'admin\', phoneNum=\'0333027154\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=58, userName=\'datt\', passWord=\'f0fce59379cc3c4e9e99a848f03e650373c1d6e62ae1a05644c86f8c6e502b9a\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'0867155409\', email=\'ngthanh.dat1305@gmail.com\', address=\'Thủ Đức\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=59, userName=\'Nguyễn Thành Đạt\', passWord=\'b7a8240da0e4ee5e13794fbd7bacc168023592f17ea7830bae67e981c1ffd66d\', role=0, fullName=\'Nguyễn Thành Đạt\', phoneNum=\'null\', email=\'20130013@st.hcmuaf.edu.vn\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=60, userName=\'Lê Dũng\', passWord=\'1ec7c8606082177a116b3ea4446307eaa3d8936dd4f3da545fca6af8d7665ceb\', role=0, fullName=\'Lê Dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=61, userName=\'Thành Đạt Nguyễn\', passWord=\'71af45ad57e9219e5dd1260d70617a0e149e30fa75938127205eac83ed9b3909\', role=0, fullName=\'Thành Đạt Nguyễn\', phoneNum=\'null\', email=\'ngthanh.dat1305@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=62, userName=\'ga la\', passWord=\'6bbc041675ca2df05887663d68e0162c285ce348fc9c7a3f6f09fc113ffd2bf2\', role=0, fullName=\'ga la\', phoneNum=\'null\', email=\'laga2134@gmail.com\', address=\'null\', gender=\'null\', enable=0, num_log_in=0}\n, UserModel{id=63, userName=\'dung5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=64, userName=\'usertest\', passWord=\'c015bc9b6d57b9f1ca4fa1e2eaec1722f076c8a698476403b202d3db5edf6438\', role=0, fullName=\'Nguyễn Văn A\', phoneNum=\'null\', email=\'kieudiem.to2006@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=65, userName=\'test5\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test5\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=66, userName=\'test9\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'test9\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=0, num_log_in=0}\n, UserModel{id=67, userName=\'testt1\', passWord=\'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\', role=0, fullName=\'lê đình quốc dũng\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=68, userName=\'test10\', passWord=\'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3\', role=0, fullName=\'test10\', phoneNum=\'null\', email=\'quocdungledinh@gmail.com\', address=\'null\', gender=\'nam\', enable=1, num_log_in=0}\n, UserModel{id=69, userName=\'tmdt2024\', passWord=\'ed0d841fe3e187be315ff6d45c116d9271b5e1c713f541005998e93feeca552c\', role=1, fullName=\'Thương mại điện tử\', phoneNum=\'0123456789\', email=\'rivasvow@gmail.com\', address=\'Đại học Nông Lâm\', gender=\'nam\', enable=1, num_log_in=0}\n]', '2024-03-20 22:00:23', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1312, 0, 11, 'List-User', '{\"draw\":2,\"recordsTotal\":4,\"recordsFiltered\":4,\"data\":[{\"id\":11,\"ids\":null,\"idPms\":null,\"userName\":\"huyen\",\"passWord\":\"5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5\",\"role\":1,\"fullName\":\"Nlu\",\"phoneNum\":null,\"email\":\"20130013@st.hcmuaf.edu.vn\",\"address\":null,\"gender\":\"nữ\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":13,\"ids\":null,\"idPms\":null,\"userName\":\"dung\",\"passWord\":\"dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\",\"role\":1,\"fullName\":\"lê đình quốc dũng\",\"phoneNum\":null,\"email\":\"quocdungledinh@gmail.com\",\"address\":null,\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":57,\"ids\":null,\"idPms\":null,\"userName\":\"admin\",\"passWord\":\"dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824\",\"role\":1,\"fullName\":\"admin\",\"phoneNum\":\"0333027154\",\"email\":\"quocdungledinh@gmail.com\",\"address\":null,\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"},{\"id\":69,\"ids\":null,\"idPms\":null,\"userName\":\"tmdt2024\",\"passWord\":\"ed0d841fe3e187be315ff6d45c116d9271b5e1c713f541005998e93feeca552c\",\"role\":1,\"fullName\":\"Thương mại điện tử\",\"phoneNum\":\"0123456789\",\"email\":\"rivasvow@gmail.com\",\"address\":\"Đại học Nông Lâm\",\"gender\":\"nam\",\"enable\":1,\"num_log_in\":0,\"access_token\":null,\"roleTitle\":\"admin\"}]}', '2024-03-20 22:00:23', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1313, 0, 69, 'AUTH  USER LOGIN SUCCESS', ' USER LOGIN SUCCESS: User - tmdt2024', '2024-03-20 22:00:35', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1314, 0, 69, 'List-Log', '', '2024-03-20 22:00:42', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1315, 0, 69, 'List-Log', '', '2024-03-20 22:00:44', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1316, 0, 69, 'List-Log', '', '2024-03-20 22:01:20', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1317, 0, 69, 'List-Log', '', '2024-03-20 22:01:22', 0, '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (1318, 0, 69, 'List-Log', '', '2024-03-20 22:01:23', 0, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_oder` int NULL DEFAULT NULL,
  `id_product` int NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `amount` int NULL DEFAULT NULL,
  `fee` int NULL DEFAULT NULL,
  `total` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `od_id`(`id_oder` ASC) USING BTREE,
  INDEX `odp_id`(`id_product` ASC) USING BTREE,
  CONSTRAINT `od_id` FOREIGN KEY (`id_oder`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `odp_id` FOREIGN KEY (`id_product`) REFERENCES `products` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (17, 12, 5, 5990000, 1, 0, 5990000);
INSERT INTO `order_detail` VALUES (18, 13, 6, 899000, 1, 0, 899000);
INSERT INTO `order_detail` VALUES (19, 14, 16, 5990000, 1, 0, 5990000);
INSERT INTO `order_detail` VALUES (20, 15, 10, 1290000, 1, 0, 1290000);
INSERT INTO `order_detail` VALUES (21, 16, 7, 1990000, 1, 0, 1990000);
INSERT INTO `order_detail` VALUES (22, 17, 5, 5990000, 1, 0, 5990000);
INSERT INTO `order_detail` VALUES (23, 18, 4, 1290000, 1, 0, 1290000);
INSERT INTO `order_detail` VALUES (24, 19, 4, 1290000, 1, 0, 1290000);
INSERT INTO `order_detail` VALUES (25, 20, 5, 5990000, 1, 0, 5990000);
INSERT INTO `order_detail` VALUES (26, 20, 20, 5225000, 1, 0, 5225000);
INSERT INTO `order_detail` VALUES (27, 21, 9, 4990000, 1, 0, 4990000);
INSERT INTO `order_detail` VALUES (28, 22, 16, 5990000, 1, 0, 5990000);
INSERT INTO `order_detail` VALUES (29, 23, 2, 176000, 1, 0, 176000);
INSERT INTO `order_detail` VALUES (30, 24, 4, 1290000, 1, 0, 1290000);
INSERT INTO `order_detail` VALUES (31, 25, 6, 899000, 1, 0, 899000);
INSERT INTO `order_detail` VALUES (32, 26, 4, 1290000, 1, 0, 1290000);
INSERT INTO `order_detail` VALUES (33, 27, 4, 1290000, 1, 0, 1290000);
INSERT INTO `order_detail` VALUES (34, 28, 2, 176000, 1, 0, 176000);
INSERT INTO `order_detail` VALUES (35, 29, 2, 176000, 1, 0, 176000);
INSERT INTO `order_detail` VALUES (36, 30, 4, 1290000, 3, 0, 3870000);
INSERT INTO `order_detail` VALUES (37, 31, 8, 1790000, 2, 0, 3580000);
INSERT INTO `order_detail` VALUES (38, 32, 2, 176000, 1, 0, 176000);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `total_money` int NULL DEFAULT NULL,
  `fee` int NULL DEFAULT NULL,
  `date_order` datetime NULL DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `transport` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phoneNum` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `uid`(`user_name` ASC) USING BTREE,
  CONSTRAINT `uid` FOREIGN KEY (`user_name`) REFERENCES `users` (`user_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (12, 'dung4', 5990000, 1580500, '2023-05-04 00:00:00', 'Giao hàng thu tiền tận nhà', 'API', 2, '269:2264:80213', '', '0355806119');
INSERT INTO `orders` VALUES (13, 'dung4', 899000, 1580500, '2023-05-04 00:00:00', 'Giao hàng thu tiền tận nhà', 'API', 2, '264:2017:70708', '', '0355806119');
INSERT INTO `orders` VALUES (14, 'dung4', 5990000, 912000, '2023-05-04 00:00:00', 'Giao hàng thu tiền tận nhà', 'API', 2, '262:3279:370814', '', '0355806119');
INSERT INTO `orders` VALUES (15, 'dung4', 1290000, 1580500, '2023-05-04 00:00:00', 'Giao hàng thu tiền tận nhà', 'API', 2, '265:2179:621014', '', '0355806119');
INSERT INTO `orders` VALUES (16, 'dung4', 1990000, 1580500, '2023-05-04 00:00:00', 'Giao hàng thu tiền tận nhà', 'API', 2, '265:2170:620905', '', '0355806119');
INSERT INTO `orders` VALUES (17, 'dung4', 5990000, 1580500, '2023-05-04 00:00:00', 'Giao hàng thu tiền tận nhà', 'API', 2, '268:2046:220908', '', '0355806119');
INSERT INTO `orders` VALUES (18, 'dung4', 1290000, 1580500, '2023-05-04 00:00:00', 'Giao hàng thu tiền tận nhà', 'API', 2, '267:2156:230528', '', '0355806119');
INSERT INTO `orders` VALUES (19, 'dung4', 1290000, 1580500, '2023-05-15 00:00:00', 'Giao hàng thu tiền tận nhà', 'API', 2, '267:2156:230522', '', '0355806119');
INSERT INTO `orders` VALUES (20, 'datt', 11215000, 912000, '2023-06-12 00:00:00', 'Giao hàng thu tiền tận nhà', '212:2084:530412', 2, 'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh', 'Giao hàng nhanh', '0867155409');
INSERT INTO `orders` VALUES (21, 'Nguyễn Thành Đạt', 4990000, 912000, '2023-06-13 00:00:00', 'Giao hàng thu tiền tận nhà', '212:2084:530412', 2, 'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh', 'Ok', 'null');
INSERT INTO `orders` VALUES (22, 'Nguyễn Thành Đạt', 5990000, 674500, '2023-06-13 00:00:00', 'Giao hàng thu tiền tận nhà', '212:2084:530412', 2, 'Phường Phước Long B, Thành Phố Thủ Đức, Hồ Chí Minh', 'ok', 'null');
INSERT INTO `orders` VALUES (23, 'huyen', 176000, 912000, '2023-06-13 00:00:00', 'Giao hàng thu tiền tận nhà', '258:1779:470702', 2, 'Xã Ea H\'leo, Huyện Ea H leo, Đắk Lắk', 'Ok shop', 'null');
INSERT INTO `orders` VALUES (24, 'huyen', 1290000, 912000, '2023-06-13 00:00:00', 'Giao hàng thu tiền tận nhà', '258:1779:470702', 2, 'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận', 'ok', 'null');
INSERT INTO `orders` VALUES (25, 'datt', 899000, 912000, '2023-06-13 00:00:00', 'Giao hàng thu tiền tận nhà', '258:1779:470702', 2, 'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận', 'Test', '0867155409');
INSERT INTO `orders` VALUES (26, 'datt', 1290000, 912000, '2023-06-13 00:00:00', 'Giao hàng thu tiền tận nhà', '258:1779:470702', 2, 'Thị trấn Võ Xu, Huyện Đức Linh, Bình Thuận', 'fix', '0867155409');
INSERT INTO `orders` VALUES (27, 'huyen', 1290000, 912000, '2023-06-17 00:00:00', 'Giao hàng thu tiền tận nhà', '212:2084:530412', 2, 'Xã Phú Cường, Huyện Cai Lậy, Tiền Giang', '', 'null');
INSERT INTO `orders` VALUES (28, 'dung4', 176000, 1580500, '2023-06-20 00:00:00', 'Giao hàng thu tiền tận nhà', '268:2194:220708', 2, 'Xã Nhật Quang, Huyện Phù Cừ, Hưng Yên', '', '0355806119');
INSERT INTO `orders` VALUES (29, 'dung4', 176000, 1580500, '2023-06-20 00:00:00', 'Giao hàng thu tiền tận nhà', '266:2204:140210', 2, 'Xã Nậm ét, Huyện Quỳnh Nhai, Sơn La', '', '0355806119');
INSERT INTO `orders` VALUES (30, 'Nguyễn Thành Đạt', 3870000, 912000, '2023-06-20 00:00:00', 'Giao hàng thu tiền tận nhà', '212:2084:530412', 2, 'Xã Phú Cường, Huyện Cai Lậy, Tiền Giang', 'Giao hàng nhanh', 'null');
INSERT INTO `orders` VALUES (31, 'usertest', 3580000, 674500, '2023-06-21 00:00:00', 'Giao hàng thu tiền tận nhà', '202:3695:90737', 0, 'Phường Linh Trung, Thành Phố Thủ Đức, Hồ Chí Minh', 'Giao hàng vào buổi trưa nhé shop', '0867155409');
INSERT INTO `orders` VALUES (32, 'Nguyễn Thành Đạt', 176000, 0, '2024-03-20 00:00:00', 'Nhận hàng tại cửa hàng', '216:3155:501112', 0, 'Xã Tân Phú Trung, Huyện Châu Thành, Đồng Tháp', '', 'null');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, 'thêm sản phẩm');
INSERT INTO `permission` VALUES (2, 'xoá sản phẩm');
INSERT INTO `permission` VALUES (3, 'sửa sản phẩm');
INSERT INTO `permission` VALUES (4, 'thêm quyền');
INSERT INTO `permission` VALUES (5, 'xoá quyền');
INSERT INTO `permission` VALUES (6, 'sửa quyền');
INSERT INTO `permission` VALUES (10, 'thêm user');
INSERT INTO `permission` VALUES (11, 'xoá user');
INSERT INTO `permission` VALUES (12, 'sửa user');
INSERT INTO `permission` VALUES (13, 'nhập hàng');
INSERT INTO `permission` VALUES (14, 'xem danh sách duyệt đơn hàng');
INSERT INTO `permission` VALUES (15, 'xem danh sách quyền');
INSERT INTO `permission` VALUES (16, 'xem danh sach danh muc san pham');
INSERT INTO `permission` VALUES (17, 'thêm danh mục sản phẩm');
INSERT INTO `permission` VALUES (18, 'xem danh sách đơn hàng ');
INSERT INTO `permission` VALUES (19, 'cập nhật đơn hàng');
INSERT INTO `permission` VALUES (20, 'sửa thông tin trên website');
INSERT INTO `permission` VALUES (21, 'xem danh sách phiếu nhập hàng');
INSERT INTO `permission` VALUES (22, 'xoa danh muc san pham');
INSERT INTO `permission` VALUES (23, 'sửa danh mục sản phẩm');
INSERT INTO `permission` VALUES (24, 'xem danh sách sản phẩm');
INSERT INTO `permission` VALUES (25, 'xem danh sách log');
INSERT INTO `permission` VALUES (26, 'thống kê log');
INSERT INTO `permission` VALUES (27, 'xem chi tiết đơn hàng');
INSERT INTO `permission` VALUES (28, 'sửa đơn hàng');
INSERT INTO `permission` VALUES (29, 'duyệt đơn hàng');
INSERT INTO `permission` VALUES (30, 'xem danh sách user');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `post_id` int NOT NULL,
  `post_category_id` int NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `ar_fkid`(`post_category_id` ASC) USING BTREE,
  CONSTRAINT `fk_cat` FOREIGN KEY (`post_category_id`) REFERENCES `posts_category` (`post_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 1, '2022-12-01', 'NHỮNG LƯU Ý KHI CHỌN MÀU CHO NỘI THẤT', 'Nếu bạn đang có nhu cầu mua sắm nội thất, chắc hẳn bạn đã có những tìm hiểu nhất định về những gì bạn muốn mua. Dù sao thì, thứ bạn đang tìm kiếm cũng là một món nội thất hài hòa với phong cách thiết kế hiện tại của bạn, nhưng vẫn đảm bảo sự thời thượng, ');
INSERT INTO `posts` VALUES (2, 1, '2022-12-02', 'MẸO PHỐI GIỮA MÀU SƠN TƯỜNG VÀ ĐỒ NỘI THẤT CHO KHÔNG GIAN SỐNG THÊM HOÀN HẢO', 'Phối màu nội thất sao cho đẹp, sang trọng, hiện đại là cả nghệ thuật của nhà thiết kế nội thất. Nội thất có đẹp cũng phải phối màu ăn ý với nhau mới có thể tạo ra một không gian đẹp...');
INSERT INTO `posts` VALUES (3, 2, '2023-01-03', '300+ MẪU TỦ BẾP GỖ TỰ NHIÊN BỀN, ĐẸP, HIỆN ĐẠI GIÁ TỐT NHẤT 2022', 'Tủ bếp là thiết bị nội thất không thể thiếu trong mọi căn bếp của gia đình Việt. Đặc biệt, tủ bếp gỗ tự nhiên với giá trị thẩm mỹ cao và độ bền chắc lâu năm đang rất được lòng người sử dụng. Hãy cùng nội thất HAPPYHOME tham khảo...');
INSERT INTO `posts` VALUES (4, 2, '2023-01-03', 'NHỮNG TONE MÀU SOFA ĐẸP BẠN KHÔNG THỂ BỎ QUA', 'Khi mua sofa, điều mà các gia chủ cũng nên cân nhắc kĩ lưỡng bên cạnh chất liệu và kiểu dáng đó chính là màu sắc của chiếc sofa. Màu sắc sofa cũng có một sự ảnh hưởng lớn đến thẩm mỹ không gian chung của phòng khách. Vì vậy, việc lựa chọn một bộ ghế sofa ');
INSERT INTO `posts` VALUES (5, 1, '2023-01-03', '\r\nÝ NGHĨA ĐỒNG HỒ TREO TƯỜNG TRANG TRÍ DECOR NGHỆ THUẬT CHO NỘI THẤT NHÀ BẠN', 'Các mẫu đồng hồ treo tường sang trọng trang trí là vật dụng vô cùng quen thuộc với tất cả mọi người. Chắc hẳn là trong bất kỳ gia đình nào cũng có sự hiện diện của một chiếc đồng hồ. Nhưng bạn đã thực sự hiểu hết ý nghĩa của chúng chưa ? Mỗi đồng hồ trang');
INSERT INTO `posts` VALUES (6, 1, '2023-01-03', '\r\nĐÈN TRANG TRÍ – ĐIỂM NHẤN KHÔNG THỂ THIẾU', 'Hiện nay, khi đời sống con người đang ngày càng được nâng lên, ngoài những yêu cầu thông thường như ăn ngon, mặc đẹp, thì yêu cầu về không gian sống cũng ngày càng được chú trọng. Vì vậy, bên cạnh những vật dụng trang trí khác, đèn trang trí trở thành một');

-- ----------------------------
-- Table structure for posts_category
-- ----------------------------
DROP TABLE IF EXISTS `posts_category`;
CREATE TABLE `posts_category`  (
  `post_category_id` int NOT NULL AUTO_INCREMENT,
  `post_category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`post_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts_category
-- ----------------------------
INSERT INTO `posts_category` VALUES (1, 'tin tức nội thất');
INSERT INTO `posts_category` VALUES (2, 'tin tuc ngoai');
INSERT INTO `posts_category` VALUES (3, 'Khuyến mãi');

-- ----------------------------
-- Table structure for posts_image
-- ----------------------------
DROP TABLE IF EXISTS `posts_image`;
CREATE TABLE `posts_image`  (
  `img_post_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`img_post_id`) USING BTREE,
  INDEX `img_a`(`post_id` ASC) USING BTREE,
  CONSTRAINT `img_a` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts_image
-- ----------------------------
INSERT INTO `posts_image` VALUES (1, 1, 'https://truongthang.vn/wp-content/uploads/2020/04/truong-thang-tranh-nghe-thuat-cho-khong-gian-thiet-ke-noi-that-trong-nha-1-e1591605565989.jpg');
INSERT INTO `posts_image` VALUES (2, 2, 'https://banghesofa.org/wp-content/uploads/2016/10/ban-ghe-go-sang-trong.jpg');
INSERT INTO `posts_image` VALUES (3, 3, 'https://tuvannhadep.com.vn/uploads/images/ban-ghe-an-go-soi-4-ghe-1.jpg');
INSERT INTO `posts_image` VALUES (4, 4, 'https://sofaphongkhachdep.com.vn/wp-content/uploads/2019/04/Ban-ghe-phong-an-dep-gia-re-kieu-dang-moi-la.jpg');
INSERT INTO `posts_image` VALUES (5, 5, 'https://vuongquocnoithat.vn/images/2019/11/20/0-hinh-anh-ban-ghe-go-phong-khach%20(10).jpg');
INSERT INTO `posts_image` VALUES (6, 6, 'https://noithatxinh.vn/Images/Upload/images/top-10-mau-ban-ghe-go-phong-khach-dep-ban-chay-nhat%20(6).jpg');
INSERT INTO `posts_image` VALUES (13, 1, 'https://localhost:44330/Template/img/blog/3.jpg');
INSERT INTO `posts_image` VALUES (14, 1, 'https://localhost:44330/Template/img/blog/2.jpg');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type`  (
  `type_id` int NOT NULL,
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES (0, 'Bàn');
INSERT INTO `product_type` VALUES (1, 'Ghế');
INSERT INTO `product_type` VALUES (2, 'Tủ');
INSERT INTO `product_type` VALUES (3, 'Đèn');
INSERT INTO `product_type` VALUES (4, 'Đồ trang trí');
INSERT INTO `product_type` VALUES (5, 'Giường');
INSERT INTO `product_type` VALUES (6, 'Nội thất văn phòng');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` int NULL DEFAULT NULL,
  `price_sell` int NULL DEFAULT NULL,
  `info` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `product_type` int NULL DEFAULT NULL,
  `product_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT 0,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `p_typefk`(`product_type` ASC) USING BTREE,
  CONSTRAINT `fk_productType` FOREIGN KEY (`product_type`) REFERENCES `product_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Ghế sofa băng 1m2 nệm vải nhiều màu SFB68071', 2950000, 2950000, 'Ghế sofa băng 1m2 nệm vải nhiều màu SFB68071 được ưa chuộng sử dụng tại các quán cafe, quán ăn, nhà hàng... bởi thiết kế hiện đại, tinh tế kết hợp với ưu điểm nệm bọc vải nhiều màu sắc đẹp mắt phù hợp với hầu hết các không gian có concept khác nhau. Ngoài', '0', '0', 'null', 'null', '0', 2, 1, '1', 64);
INSERT INTO `products` VALUES (2, 'ĐÈN NGỦ, ĐÈN CẢM ỨNG SILICON MÈO MINI N278', 250000, 176000, 'Đèn ngủ, đèn cảm ứng silicon mèo mini với hình dáng dễ thương, bề mặt dẻo mềm mại sẽ trở thành một người bạn nhỏ trong phòng ngủ của người dùng, đặc biệt là trẻ em. Ánh đèn dịu nhẹ, không chói mắt, đổi màu từ từ khiến tinh thần thư giãn, đưa bạn vào giấc ', '0', '0', 'đỏ', 'to', '0', 1, 3, '1', 10);
INSERT INTO `products` VALUES (3, 'Tủ Giày 3 Ngăn Marcell - Màu Đá Xanh', 1590000, 1590000, 'Thiết kế thông minh các ngăn tủ đều có bản lề xoay, giúp đóng mở theo chiều dọc với một góc nghiêng phù hợp giúp bạn lấy hoặc đặt giày một cách thuận tiện hơn.Ngăn tủ rộng rãi: thiết kế với ngăn tủ 1 tầng, tối ưu hóa diện tích để giày, dép của bạn. Giúp b', '1', 'nhật', 'xanh', 'Dài 640mm x Rộng 180mm x Cao 1228mm', NULL, 1, 2, '1', 0);
INSERT INTO `products` VALUES (4, 'Bàn Sofa – Bàn Cafe – Bàn Trà Tròn Gỗ MOHO OSLO 901', 1290000, 1290000, 'Veneer gỗ sồi tự nhiên\r\nBề mặt sản phẩm Bàn Sofa Gỗ Tròn MOHO OSLO 901 phủ Veneer gỗ sồi tự nhiên cho bề mặt vân gỗ tinh tế, bền màu, nhẵn và sáng bóng. Đồng thời, giúp sản phẩm không bị co ngót, nứt khi thời tiết thay đổi.Chất liệu cao su tự nhiên đảm bả', '1', 'nhật', 'xanh', NULL, NULL, 1, 0, '1', 0);
INSERT INTO `products` VALUES (5, 'Giường Ngủ Gỗ Tràm MOHO VLINE 601 Nhiều Kích Thước', 5990000, 5990000, 'Gỗ tràm tự nhiên sử dụng gỗ tràm tự nhiên đảm bảo vệ độ chắc chắn cao, chống công vênh, mối mọt cho giường ngủ của bạn.Sử dụng chất liệu gỗ thông giúp giường ngủ VLINE 601 có khả năng chịu lực tốt và độ bền cao.\r\nGiường ngủ VLINE có kích thước chiều ngang', '1', 'nhật', 'xanh', 'Dài 640mm x Rộng 180mm x Cao 1228mm', NULL, 1, 5, '1', 0);
INSERT INTO `products` VALUES (6, 'Ghế Văn Phòng Chân Quỳ MOHO CALLOSO 701', 899000, 899000, ' Phần khung lưng và tựa tay được làm bằng chất liệu nhựa cao cấp kết hợp cùng kết cấu bo cong từng đường nét vừa tạo sự mềm mại trong thiết kế nhưng lại vô cùng chắc chắn và độ bền cao.Vải lưới mềm mại thoáng khí Với chất liệu vải nhập cao cấp, thoáng khí', '1', 'mĩ', 'xanh', NULL, NULL, 1, 1, '1', 12);
INSERT INTO `products` VALUES (7, 'Ghế Đôn Sofa Gỗ Cao Su Tự Nhiên MOHO VLINE 601', 1990000, 1990000, 'Ghế sofa đơn có thể kết hợp đa dạng phong cách có thiết kế tối giản, dễ dàng kết hợp với ghế sofa VLINE thông thường và sofa góc để tạo thành một bộ sản phẩm hoàn chỉnh cho nội thất phòng khách nhà bạn thêm hoàn thiện, nâng tầm không gian sống nhà bạn. Vi', '1', 'nhật', 'xanh', 'Dài 640mm x Rộng 180mm x Cao 1228mm', NULL, 1, 1, '1', 0);
INSERT INTO `products` VALUES (8, 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO NEXO 601', 1790000, 1790000, 'Ghế ăn gia đình NEXO sở hữu thiết kế tối giản, không cầu kỳ, mang đậm phong cách Scannadivian đẹp đẽ và hiện đại. Các chi tiết trên từng góc cạnh của ghế được xử lý bo tròn vô cùng hoàn hảo, tạo nên một điểm nhấn tinh tế và êm ái trong thiết kế. Ngoài ra,', '1', 'nhật', 'xanh', NULL, NULL, 1, 1, '1', 3);
INSERT INTO `products` VALUES (9, 'Bàn Ăn Gỗ Cao Su Tự Nhiên MOHO ODENSE 601', 4990000, 4990000, 'Bàn ăn đẹp mang kiểu dáng tinh tế, tối giản thiết kế bàn ăn toát lên vẻ ngoài đây tinh tế nhờ vào đường cong và bo tròn góc cạnh, mặt bàn có kích thước lớn kết hợp với khung chân bàn được tiện thanh mảnh nhưng vẫn đảm bảo độ chắc chắn.Kết cấu bàn ăn gỗ ch', '1', 'nhật', 'xanh', NULL, NULL, 1, 0, '1', 0);
INSERT INTO `products` VALUES (10, 'Ghế Ăn Gỗ Cao Su Tự Nhiên MOHO VIBORG 601', 1290000, 1290000, 'Ghế ăn VIBORG mang trong mình thiết kế tinh tế và hiện đại.Ghế ăn VIBORG sở hữu thiết kế tối giản, không cầu kỳ nhưng các chi tiết trên từng góc cạnh của ghế được xử lý một cách hoàn hảo. Chúng mang đường bo cong hoàn hảo, từ đường bo cong của tựa lưng đế', '1', 'nhật', 'xanh', NULL, NULL, 1, 1, '1', 0);
INSERT INTO `products` VALUES (11, 'Ghế Ăn Gỗ Cao Su Tự Nhiên 601 MOHO NYBORG', 1290000, 1290000, 'Ghế ăn gia đình có thiết kế tối giản Đặc trưng của bộ sưu tập NYBORG là sự tối giản trong từng món đồ nội thất gỗ. Sự đồng bộ với những đường nét thiết kế của bàn ăn, ghế ăn NYBORG tạo nên bộ bàn ăn 4 ghế mang lại cảm giác đơn giản nhưng không kém sang tr', '1', 'nhật', 'xanh', NULL, NULL, 1, 1, '1', 0);
INSERT INTO `products` VALUES (12, 'Bàn Ăn Gỗ Tràm Tự Nhiên MOHO NYBORG 301', 4990000, 4990000, 'Thiết kế mạnh mẽ và tối giản với thiết kế khác biệt so với các bộ sưu tập hiện tại của MOHO, bàn ăn NYBORG mang trong mình một thiết kế mạnh mẽ, đơn giản nhưng cùng với màu sắc vintage, đen bóng hòa với màu của gỗ tràm tạo nên một thiết kế rất đẹp mắt và ', '1', 'nhật', 'xanh', NULL, NULL, 1, 0, '1', 0);
INSERT INTO `products` VALUES (13, 'Ghế sofa băng 200x90cm Loveseats 01 nệm bọc simili cao cấp SFB68041', 10450000, 10450000, 'Ghế sofa băng Loveseats 01 SFB68041 là một trong những mẫu ghế băng toát lên nét đẹp cổ điển được nhiều khách hàng ưa chuộng và sử dụng trong các thiết kế có hơi hướng retro. Nệm mút D40 có độ đàn hồi êm ái, mang đến sự thoải mái khi ngồi. Nệm bọc simili ', '1', 'nhật', 'xanh', NULL, NULL, 1, 1, '1', 0);
INSERT INTO `products` VALUES (14, 'Ghế sofa đơn, ghế cafe nệm simili khung sắt TTG014', 1794000, 1794000, 'Ghế sofa đơn, ghế cafe nệm simili khung sắt TTG014 toát lên vẻ đẹp tinh tế với khung ghế được làm từ sắt tròn thanh mảnh nhưng có khả năng chịu lực tốt kết hợp với phần nệm bọc simili sang trọng, nệm mút êm ái mang đến sự thoải mái khi ngồi lâu. Ghế sofa ', '1', 'nhật', 'xanh', NULL, NULL, 1, 1, '1', 0);
INSERT INTO `products` VALUES (15, 'Ghế sofa đơn Napa nệm bọc vải tay viền gỗ GSD68064', 1980000, 1980000, 'Ghế sofa đơn Napa nệm bọc vải tay viền gỗ GSD68064 với phần lưng, nệm ghế được làm từ chất liệu vải dày dặn, có độ đàn hồi cao mang đến sự thoải mái cho người ngồi trong quá trình sử dụng kết hợp cùng khung chân được chế tác từ sắt mang đến sự vững chãi v', '1', 'nhật', 'xanh', NULL, NULL, 1, 1, '1', 0);
INSERT INTO `products` VALUES (16, 'Tủ trang trí cửa kính gỗ cao su chân sắt KTB68123', 6400000, 5990000, 'Tủ trang trí cửa kính gỗ cao su chân sắt KTB68123 sử dụng chất liệu chính là gỗ cao su tiêu chuẩn AA dày 17mm sơn PU hoàn thiện màu sắc đẹp kết hợp các hệ hộc kéo và ngăn mở đẹp mắt phối màu hợp lý sẽ giúp không gian nhà bạn thêm đẹp hơn. Chân sắt sơn tĩn', '1', 'nhật', 'xanh', NULL, NULL, 1, 2, '1', 0);
INSERT INTO `products` VALUES (17, 'Tủ trang trí cửa mây đế chân sắt KTB68119', 2450000, 2450000, 'Tủ trang trí cửa mây đế chân sắt KTB68119 có kích thước tương đối nhỏ gọn, dễ di chuyển phù hợp với không gian có diện tích vừa và nhỏ. Chất liệu chính được sử dụng là gỗ cao su tiêu chuẩn AA được xử lý và hoàn thiện chống thấm đảm bảo bền bỉ theo thời gi', '1', 'nhật', 'xanh', NULL, NULL, 1, 2, '1', 0);
INSERT INTO `products` VALUES (18, 'Sofa băng 1m7 nệm bọc vải chân gỗ SFB68060', 6600000, 5280000, 'Sofa băng 1m7 nệm bọc vải chân gỗ SFB68060 là mẫu ghế vừa mang phong cách hiện đại vừa toát lên vẻ đẹp cổ điển khó mà cưỡng lại nên được rất nhiều khách yêu thích và lựa chọn cho phòng khách của mình. Lưng ghế với thiết kế giật nút kết hợp chân gỗ tiện là', '1', 'nhật', 'xanh', NULL, NULL, 1, 1, '1', 0);
INSERT INTO `products` VALUES (19, 'Bàn Sofa Olivia 2 tầng chân sắt TT68132', 1495000, 1420000, 'Bàn Sofa Olivia 2 tầng chân sắt TT68132 mẫu bàn là sự kết hợp của 3 vật liệu chính gồm Gỗ Tràm dày 25mm, Gỗ cao su dày 17mm và khung chân sắt với kích thước mặt bàn trên là tròn 60cm được làm từ gỗ cao su tiêu chuẩn AA dày 17mm sơn Pu Trắng hoàn thiện, mặ', '1', 'nhật', 'xanh', NULL, NULL, 1, 0, '1', 0);
INSERT INTO `products` VALUES (20, 'Giường ngủ khung sắt Ferrro - 206x160x35 (cm) GN68004', 5500000, 5225000, 'Giường ngủ Ferro GN68004 có kích thước Queen Size 206x160x35 (cm) phù hợp dành cho hai người sử dụng. Nếu bạn đang tìm kiếm một mẫu giường ngủ có thiết kế độc đáo và sáng tạo thì Giường Ngủ Ferro GN68004 sẽ là một sự lựa chọn tuyệt vời. Phong cách kết hợp', '1', 'nhật', 'xanh', NULL, NULL, 1, 5, '1', 0);
INSERT INTO `products` VALUES (25, 'Bàn làm việc 120x60cm gỗ tràm chân sắt sơn tĩnh điện SPD68200', 1650, 1485000, 'Sở hữu kiểu dáng đơn giản, đẹp mắt với phần mặt bàn được mở rộng thêm viền gỗ giúp tăng thêm chất mộc cho góc làm việc. Với chất gỗ keo dày dặn đem lại sự chắc chắn và bền bỉ theo thời gian, với đó là chất vân gỗ độc đáo rất phù hợp để trang trí cho căn phòng làm việc thêm sinh động hơn.', '0', 'việt nam', 'màu cánh gián', '120x60x75cm', '0', 1, 0, '1', 10);
INSERT INTO `products` VALUES (26, 'Bàn làm việc 120x60cm gỗ tràm chân sắt chữ A hệ Minimal SPD68201', 1820000, 1638000, 'Bàn làm việc gỗ Tràm SPD68201 với mặt bàn làm từ gỗ tràm 25mm tiêu chuẩn AA  được xử lý PU hoàn thiện cho bề mặt sản phẩm rất đẹp mắt, chống nước tuyệt đối. Kết hợp với mặt bàn là hệ khung chân sắt chữ A hệ Minimal có cơ cấu lắp ráp ngàm vô cùng chắc chắn và tiện lợi khi có thể dễ dàng tháo lắp và vận chuyển. ', '0', 'việt nam', 'Gỗ tràm', '120x60x75cm', '0', 1, 0, '1', 10);
INSERT INTO `products` VALUES (27, 'Bàn làm việc gỗ Tràm dày 25mm màu cánh gián chân sắt Aconcept HBWD046', 1710000, 1624000, ' Với mặt bàn làm từ gỗ tràm 25mm tiêu chuẩn AA  được xử lý PU hoàn thiện cho bề mặt sản phẩm rất đẹp mắt, chống nước tuyệt đối. Kết hợp với mặt bàn là hệ khung chân sắt hệ Aconcept có cơ cấu lắp ráp ngàm vô cùng chắc chắn và tiện lợi khi có thể dễ dàng tháo lắp và vận chuyển. Mặt bàn nhiều kích thước từ nhỏ gọn 100x60cm đến kích thước lớn hơn 140x60cm giúp bạn có sự lựa chọn phù hợp với nhu cầu sử dụng.', '0', 'việt nam', 'màu cánh gián', '100-120-140x60x75cm', '0', 1, 0, '1', 10);
INSERT INTO `products` VALUES (28, 'Bàn làm việc 120x60cm gỗ Plywood hệ YCHI HBYC013', 1760000, 1584000, 'Bàn làm việc 120x60cm gỗ Plywood HBYC013 thuộc hệ bàn YCHI với khung chân sắt được lấy ý tưởng từ chữ Y kiểu dáng độc đáo, đẹp mắt. Khung chân sắt sử dụng sắt vuông 40mm và sắt hộp 40x80mm mang đến sự chắc chắn, đặc biệt hệ YCHI sử dụng 3 thanh giằng cực kỳ chắc chắn. Mặt bàn gỗ Pywood cốt gỗ tự nhiên ề mặt phủ melamin nhiều vân màu sắc lựa chọn. Mặt bàn kích thước 120x60cm theo tiêu chuẩn bàn làm việc hiện nay.', '0', 'việt nam', 'màu vân sồi', '120x60x75cm', '0', 1, 0, '1', 10);
INSERT INTO `products` VALUES (29, 'Ghế giám đốc chân xoay có ngả lưng HOGVP149', 3700000, 3515000, 'Ghế giám đốc chân xoay có ngả lưng HOGVP149 được chú trọng thiết kế cùng kiểu dáng sang trọng phù hợp với người dùng là doanh nhân. Ghế được gia công tỉ mỉ với các đường chỉ may cẩn thận, đẹp mắt. Lưng cao có thể ngả lưng kết hợp tựa đầu thư giãn dễ dàng chống mệt mỏi tăng năng suất công việc và giúp bạn nghỉ ngơi sau những giờ làm việc căng thẳng.', '0', 'việt nam', 'nhiều màu', '', '0', 1, 1, '1', 10);
INSERT INTO `products` VALUES (30, 'Ghế làm việc chân xoay nệm simili GAKJB-673X', 1150000, 1150000, 'Ghế làm việc chân xoay nệm simili GAKJB-673X có cấu tạo gồm 2 phần nệm ngồi và chân xoay có bánh xe cùng kích thước nhỏ gọn phù hợp với không gian làm việc có diện tích khiêm tốn. Thiết kế tối giản nhưng không kém phần đẹp mắt kết hợp phần nệm ngồi bọc simili nhiều màu sắc chắc chắn sẽ là điểm nhấn cho không gian làm việc của bạn thêm phần ấn tượng.', '0', 'việt nam', 'Xám, Kem, Đen', '48x45x82cm', '0', 1, 1, '1', 10);
INSERT INTO `products` VALUES (31, 'Ghế làm việc chân xoay Iris nệm nhiều màu GAK188', 1750000, 1750000, 'Ghế làm việc chân xoay Iris nệm nhiều màu GAK188 với phần lưng và nệm ghế bọc simili cao cấp hạn chế trầy xước, chống thấm nước dễ dàng vệ sinh. Chân ghế được làm bằng chất liệu sắt sơn tĩnh điện tạo sự chắc chắn khi ngồi, bánh xe di chuyển linh hoạt, thuận tiện khi cần lấy đồ. Bên cạnh đó ghế làm việc GAK188 với kiểu dáng đẹp mắt chắc chắn là sẽ là điểm nhấn cho không gian làm việc của bạn.', '0', 'việt nam', 'Nâu, Kem, Xanh', '56x56x86cm', '0', 1, 1, '1', 10);
INSERT INTO `products` VALUES (32, 'Kệ sách gỗ di động nhỏ gọn hình tròn 2 tầng KS68198', 1200000, 1080000, 'Kệ sách di động 2 tầng KS68198 sử dụng hoàn toàn bằng gỗ cao su tự nhiên được xử lý và hoàn thiện chống thấm nước, chống cong vênh và có vân màu sắc đẹp mắt, ngoài màu gỗ tự nhiên bạn có thể lựa chọn những màu sắc khác trong bảng màu gỗ tại HomeOffice. Dưới chân kệ trang bị bánh xe có khoá dễ dàng di chuyển khi cần. Kiểu dáng kệ độc đáo phù hợp nhiều không gian từ phòng khách gia đình đến văn phòng công ty hay sảnh chờ khu vực công cộng,...', '0', 'việt nam', 'Gỗ màu tự nhiên', '45x45x75cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (33, 'Tủ trang trí gỗ tự nhiên KTB68127', 4950000, 4455000, 'Tủ trang trí gỗ tự nhiên KTB68127  sử dụng chất liệu chính là gỗ cao su tiêu chuẩn AA dày 17mm sơn PU hoàn thiện màu sắc đẹp kết hợp các hệ hộc kéo và ngăn mở đẹp mắt phối màu hợp lý sẽ giúp không gian nhà bạn thêm đẹp hơn. Bên cạnh đó, dưới chân tủ gắn bánh xe có khoá chắc chắn giúp việc di chuyển thuận tiện dễ dàng hơn.', '0', 'việt nam', 'Màu gỗ óc chó.', '120x40x90(cm)', '0', 1, 2, '1', 0);
INSERT INTO `products` VALUES (34, 'Kệ sách nhỏ đơn giản 2 ngăn gỗ cao su KS68195', 790000, 790000, 'Với kiểu dáng nhỏ gọn và đơn giản, mẫu kệ gỗ KS68195 mang lại cho không gian lưu trữ linh động, giup đánh thức sự sáng tạo của bạn. Nếu có nhiều ý tưởng trang trí cho không gian sống và làm việc, bạn có thể bố trí thêm 2 hoặc 3 chiếc kệ gỗ KS68195 để bạn có thể vừa trang trí lại căn phòng thêm sinh động, vừa có thêm không gian lưu trữ. Kệ có 2 ngăn để đồ có khoảng rộng có kích thước vừa những cuốn sách cỡ 30cm. Bạn có thể đặt vài món đồ trang trí, sách vở hoặc chậu cây lên đó.', '0', 'việt nam', 'Gỗ tự nhiên', '30x50x60cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (35, 'Ghế cafe lưng tựa bọc nệm chân sắt sơn tĩnh điện GAK626', 1650000, 1567000, 'Ghế cafe GAK626 là dòng ghế ngồi bọc nệm cao cấp, có phần lưng tựa vừa vặn và êm ái. Với phần nệm ngồi và lưng tựa được bọc nệm dày dặn, tạo cảm giác thoải mái và dễ chịu khi ngồi lâu. Bên ngoài được bọp lớp vải bố có tông màu xám trắng trung tính, trang nhã phù hợp với nhiều không gian nội thất, dễ dàng phối đồ nội thất hơn. Chiều cao ghế được căn chỉnh đúng tiêu chuẩn, thích hợp sử dụng cho nhiều mục đích khác nhau, làm ghế bàn ăn, ghế cafe hoặc ghế làm việc. Hệ khung chân sắt được gia công chắc chắn, mối hàng được xử lý tỉ mỉ trên từng chi tiết.', '0', 'việt nam', 'Cam - Xám - Đen', '50x53x77', '0', 1, 1, '1', 0);
INSERT INTO `products` VALUES (36, 'Ghế xếp lưới lưng cao khung sắp sơn tĩnh điện GCF156', 169000, 169000, 'Ghế xếp lưới cafe GCF156 là loại ghế chuyên dụng cho quán cafe, trà sữa, khách sạn resort, hoặc những hàng quán cần sự linh hoạt. Với chất liệu khung lưới dày dặn, chịu tải trọng tốt, ngồi nhiều vẫn giữ được dáng ghế. Khung sắt được làm chắc chắn, với loại sắt dày dặn, đảm bảo cho người ngồi cảm giác thoải mái, không bị ọp ẹp và rung lắc. Bề mặt khung sắt được sơn tĩnh điện chống gỉ, giúp đảm bảo tính thẩm mỹ và độ bền cho sản phẩm. ', '0', 'việt nam', 'Đen', ' 45x45x80cm', '0', 1, 1, '1', 0);
INSERT INTO `products` VALUES (37, 'Ghế đôn tròn gỗ chân uốn plywood GCF154', 400000, 360000, 'Ghế đôn gỗ GCF154 mẫu ghế đơn giản cho không gian quán cafe mộc mạc chắc chắn, với mặt gỗ cao su tròn sơn PU hoàn thiện, sản phẩm phù hợp với nhiều mục đích sử dụng trong các không gian khác nhau. ', '0', 'việt nam', 'màu gỗ tự nhiên', '32x38x45cm', '0', 1, 1, '1', 0);
INSERT INTO `products` VALUES (38, 'Bàn ăn tròn 1m VERA mặt gỗ nhiều màu chân sắt sơn tĩnh điện BA68044', 2365000, 2128000, 'Mặt bàn được làm từ gỗ cao su tự nhiên, dày 17m sơn PU hoàn thiện tiêu chuẩn của HomeOfice với 5 màu giúp bạn có được sự lựa chọn hợp với nhu cầu và sở thích của bản thân, đây là một trong những ưu điểm của HomeOffice được nhiều khách hàng yêu thích. Chân sắt được gia công tỉ mỉ từng góc độ cho ra đời khung chân bàn có độ hoàn thiện cao và khả năng chịu lực tốt, bề mặt sắt phủ lớp sơn tĩnh điện cao cấp chống rỉ sét đảm bảo độ bền theo thời gian. Mẫu bàn ăn tròn được nhiều người dùng ưa chuộng vì khả năng tiết kiệm diện tích bày trí mang đến không gian nhà bếp thoải mái, thoáng đãng mà gần gũi sẽ góp phần giúp bạn tạo nên không gian nhà bếp lý tưởng.', '0', 'việt nam', 'màu gỗ tự nhiên ', '100x75cm', '0', 1, 0, '1', 0);
INSERT INTO `products` VALUES (39, 'Bàn ăn Mini gỗ cao su chân sắt lắp ráp BA68041', 1345000, 1278000, 'Bàn ăn Mini gỗ cao su chân sắt lắp ráp BA68041 mặt bàn gỗ cao su tự nhiên được hoàn thiện PU chống thấm nước, cong vênh. Chân bàn cơ cấu lắp ráp hướng đến sự tiện lợi, giúp bạn thuận tiện khi tháo lắp hay vận chuyển. Kích thước mặt bàn 70x70(cm) tương đối nhỏ gọn phù hợp với không gian có diện tích vừa và nhỏ, bàn BA68041 có thể là bàn ăn giúp tiết kiệm diện tích tạo sự thoáng đãng cho nhà bếp của bạn.', '0', 'việt nam', 'màu gỗ tự nhiên', '70x70x75cm', '0', 1, 0, '1', 0);
INSERT INTO `products` VALUES (40, 'Giường tầng khung sắt lắp ráp mặt gỗ tự nhiên GT013', 8500000, 8500000, 'Giường tầng khung sắt lắp ráp GT013 với hệ khung sắt lắp ráp chắc chắn từ sắt hộp dày 1.2mm với hệ khung ngàm hiện đại, gia công hoàn thiện ở mức cực cao, sơn tĩnh điện đẹp mắt. Các hệ gỗ cao su dày 18mm tiêu chuẩn AA được xử lý PU hoàn thiện bề mặt đẹp. Đây là sản phẩm thông minh giúp vận chuyển vào các căn nhà diện tích khiêm tốn. Bên cạnh công năng thì chất lượng sản phẩm, vẻ thẩm mỹ cũng được HomeOffice chú ý đến trong các chi tiết sản xuất hoàn thiện. Mẫu giường phù hợp với nệm kích thước 1mx2m 2 tầng cho hai người nằm ngủ thoải mái .', '0', 'việt nam', ' Nhiều màu', '206x120x180cm', '0', 1, 5, '1', 0);
INSERT INTO `products` VALUES (41, 'Giường ngủ kết hợp trang trí có hộc kéo gỗ cao su GN68035', 12045000, 11443000, 'Giường ngủ kết hợp trang trí có hộc kéo gỗ cao su GN68035 với thiết kế độc đáo và tiện ích cao khi kết hợp nhiều ngăn và hai hộc kéo rộng rãi giúp bạn tối ưu không gian, mền gối sẽ được bảo quản gọn gàng đẹp mắt hơn mang đến phòng ngủ một vẻ đẹp đơn giản, nhẹ nhàng và tinh tế đồng thời cũng giúp cho không gian rộng rãi, thoáng đạt hơn. Giường ngủ tích hợp hộc kéo chính là giải pháp tuyệt vời cho xu hướng nhà phố, nhà chung cư hiện nay. Chất liệu làm nên giường ngủ GN68035 được chúng tôi sử dụng là gỗ cao su AA chuẩn xuất khẩu, đã được xử lý qua công nghệ hiện đại và được phủ sơn PU chống thấm đảm bảo sử dụng trong thời gian dài.', '0', 'việt nam', 'màu gỗ tự nhiên', '160x220x100cm', '0', 1, 5, '1', 0);
INSERT INTO `products` VALUES (42, 'Giường tầng kết hợp tủ quần áo gỗ cao su khung sắt GT009', 12320000, 11704000, 'Giường tầng kết hợp tủ quần áo GT009 sử dụng chất liệu chính là gỗ cao su tiêu chuẩn AA được xử lý chống thấm nước và sơn PU vân màu đẹp mắt kết hợp cùng hệ khung sắt chắc chắn, bề mặt sắt sơn tĩnh điện chất lượng cao bền bỉ theo thời gian. Thiết kế thông minh khi kết hợp giường ngủ và tủ quần áo trong cùng một sản phẩm giúp tối ưu diện tích sử dụng, là giải pháp tuyệt vời cho không gian có diện tích khiêm tốn. Bên cạnh đó, bạn có thể đặt bàn học, bàn làm việc bên cạnh tủ mà không ảnh hưởng đến việc sử dụng tủ quần áo vì tủ có thiết kế cửa lùa và không gian mở, rất tiện lợi đúng không nào.', '0', 'việt nam', 'nhiều màu lựa chọn', '208x123x190cm', '0', 1, 5, '1', 5);
INSERT INTO `products` VALUES (43, 'Giường 140x200cm kết hợp kệ trang trí gỗ cao su khung sắt GT012', 12320000, 11704000, 'Giường 140x200cm kết hợp kệ trang trí gỗ cao su khung sắt GT012 với hệ khung sắt lắp ráp sơn tĩnh điện vô cùng chắc chắn và khoa học kết hợp với gỗ cao su tiêu chuẩn AA sơn Pu hoàn thiện với hai màu chính là gỗ tự nhiên ấm áp và màu nâu lau độc đáo. Đây chắc chắn là sự lựa chọn hoàn hảo cho căn hộ - chung cư hay khu ký túc xá có diện tích sử dụng nhỏ nhờ thiết kế thông minh mang tính tiện ích cao khi tích hợp không gian học tập, làm việc và nghỉ ngơi mang đến không gian thoáng đãng hơn.', '0', 'việt nam', 'nhiều màu lựa chọn', '255x145x180cm', '0', 1, 5, '1', 0);
INSERT INTO `products` VALUES (44, 'Kệ treo quần áo ống nước gỗ tự nhiên KTD68004', 2420000, 2251000, 'Kệ treo quần áo ống nước gỗ tự nhiên KTD68004 có thiết kế độc đáo và tiện lợi với 2 phần là kệ treo quần áo bằng ống nước và kệ gỗ để đồ. Kệ ống nước chiều dài 90cm giúp treo quần áo được gọn gàng, ngăn nắp và phía bên dưới là tấm gỗ bạn có để giày dép hay các món đồ thường sử dụng. Phía bên phải là kệ gỗ chia thành 4 tầng để được nhiều món vật dụng hay trưng bày đồ trang trí. Bên cạnh đó, dưới chân kệ gắn bánh xe có khoá tăng độ linh hoạt, giúp việc di chuyển dễ dàng hơn', '0', 'việt nam', 'màu gỗ tự nhiên ', ' 130x120cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (45, 'Kệ trang trí phòng khách có hộc để cây cảnh KTB68135', 2520000, 1590000, 'Kệ trang trí KTB68135 được bố trí thêm ngăn để cây xanh, giúp bạn theo kịp xu hướng trồng cây nội thất, tạo mảnh xanh trong nhà mà không khiến không gian trở nên quá lộn xộn. Ngăn để cây cảnh trên cùng có thể giúp căn phòng gọn gàng, xanh tươi và không gian cũng trở nên hiện đại hơn. Hãy thử kết hợp với một số loại cây thân thảo, buông rũ và vươn dài như một loại cây trầu bà, giúp tạo độ sâu, giảm bớt độ phẳng của chiếc kệ. Không những giúp trang trí lại không gian nội thất phòng khách, kệ trang trí KTB68135 là ý tưởng tuyệt vời mang lại giải pháplưu trữ giúp cho không gian trở nên gọn gàng hơn.', '0', 'việt nam', 'Màu Gỗ sơn PU', '120x30x110cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (46, 'Kệ giày kiêm giá treo đồ thông minh gỗ Tre KG68061', 1800000, 1800000, 'Kệ giày kiêm giá treo đồ thông minh gỗ Tre KG68061 sản là sản phẩm nằm trong bộ sưu tập ghế tủ giày với chất liệu 100% gỗ tre ép siêu cứng, màu sắc đẹp sơn PU hoàn thiện đẹp mắt với màu sắc tự nhiên. Với thiết kế thông minh khi tích hợp ghế ngồi, giá treo đồ với kệ giày giúp bạn dễ dàng hơn khi cần thay đổi giày, dép.', '0', 'việt nam', 'Màu gỗ tự nhiên.', '70x33x175cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (47, 'Kệ để giày dép gỗ Tre ghép KG68069', 3750000, 1590000, 'Kệ để giày dép gỗ Tre ghép KG68069 sản là sản phẩm nằm trong bộ sưu tập ghế tủ giày với chất liệu 100% gỗ tre ép siêu cứng, màu sắc đẹp sơn PU hoàn thiện đẹp mắt với màu sắc tự nhiên. Với thiết kế thông minh khi tích hợp tủ để giày với ghế ngồi giúp bạn dễ dàng hơn khi cần thay đổi giày, dép. Mẫu kệ giày gỗ tre không những hoàn thành tốt công năng của mình mà còn là món đồ trang trí đẹp mắt cho không gian của bạn.', '0', 'việt nam', 'màu cánh gián', '120x60x75cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (48, 'Kệ sách kệ trang trí gỗ Plywood khung sắt KS68167', 4290000, 3861000, 'Kệ sách kệ trang trí gỗ Plywood khung sắt KS68167 là sự kết hợp giữa các tấm gỗ Plywood và những khung sắt được sắp xếp với nhay một cách hài hòa và bắt mắt người nhìn. Với kiểu dáng hiện đại, mang tính thẩm mỹ cao cùng những tiện ích cần có kệ KTB68167 phù hợp với nhiều không gian khác nhau từ văn phòng công ty đến phòng khách gia đình đều có thể điểm nhấn cho căn phòng của bạn.', '0', 'việt nam', ' Màu Gỗ Plywood', '120x30x146', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (49, 'Bàn làm việc gấp gọn có bánh xe (Version 2) gỗ cao su SPD68188', 1850000, 1480000, 'Bàn làm việc gấp gọn có bánh xe (Version 2) gỗ cao su SPD68188 là sản phẩm thuộc dòng bàn linh hoạt, gọn gàng khi chân bàn được thiết kế hướng đến sự tiện lợi tối đa khi có thể gấp gọn một cách dễ dàng. Mặt bàn gỗ cao su dày 17mm tiêu chuẩn AA được xử lý và hoàn thiện chống thấm nước, gỗ cao su tự nhiên dẻo dai bền bỉ theo thời gian, bên cạnh đó gỗ cao su tại HomeOffice được sơn PU 5 màu sắc khác nhau giúp bạn có thêm sự lựa chọn. Dưới mỗi chân bàn được trang bị bánh xe có chốt khóa giúp việc di chuyển trở nên nhẹ nhàng hơn, và có thể sắp xếp các bố cục khác nhau tùy theo tính chất và quy mô với mọi không gian lớn hay nhỏ.', '0', 'việt nam', 'màu gỗ tự nhiên ', '120x60x75cm', '0', 1, 0, '1', 0);
INSERT INTO `products` VALUES (50, 'Bàn kết hợp kệ gỗ cao su chân sắt BD68088', 3350000, 2847000, 'Bàn kết hợp kệ gỗ cao su chân sắt BD68088 sử dụng gỗ cao su ghép tiêu chuẩn AA dày 17mm của HomeOffice đã được khẳng định qua nhiều năm, màu sắc tự nhiên đẹp mắt, khung chân sắt sơn tĩnh điện rất chắc chắn, mẫu bàn BD68088 không chỉ dùng làm bàn học mà còn có thể dùng làm làm việc đều được. ', '0', 'việt nam', 'Màu gỗ tự nhiên', '100x60x115cm', '0', 1, 0, '1', 0);
INSERT INTO `products` VALUES (51, 'Kệ tivi gỗ cao su khung sắt KTV68097', 3400000, 2720000, 'Kệ tivi gỗ cao su khung sắt KTV68097 với chiều dài 1.5m phù hợp với đa phần không gian và mọi thiết bị có thể vừa làm kệ tivi vừa làm tủ trang trí đều rất đẹp mắt. Chất liệu chính là gỗ cao su sơn Pu phối hợp giữa màu đen và màu tự nhiên kết hợp cùng khung sắt sơn tĩnh điện vô cùng chắc chắn. Sở hữu kiểu dáng hiện đại, tinh tế kết hợp với thiết kế thông minh chia nhiều ngăn, tầng giúp tăng không gian lưu trữ trong phòng khách.', '0', 'việt nam', 'Gỗ sơn PU màu tự nhiên', '150x40x50cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (52, 'Kệ tivi gỗ tự nhiên chân sắt KTV68098', 3400000, 2720000, 'Kệ tivi gỗ tự nhiên chân sắt KTV68098 với chiều dài 1m6 và chiều rộng 40cm phù hợp với các không gian phòng khách vừa và lớn, kệ cao 50cm nên có thể để tivi đứng trên kệ chiều cao sẽ phù hợp với chiều cao của ghế sofa. Chất liệu chính là gỗ cao su tiêu chuẩn AA dày 17mm sơn PU hoàn thiện màu sắc đẹp kết hợp chân kệ inox mang đến vẻ sang trọng nhưng không mất đi sự chắc chắn cần có. Kệ tivi KTV68098 sở hữu kiểu dáng đơn giản, tinh tế với các hệ hộc kéo và cửa mở đẹp mắt phối màu hợp lý sẽ giúp không gian nhà bạn thêm đẹp hơn.', '0', 'việt nam', 'Gỗ sơn PU ', '160x40x50cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (53, 'Kệ tivi có ngăn kéo gỗ cao su chân sắt KTV68096', 3600000, 2880000, 'Kệ tivi có ngăn kéo gỗ cao su chân sắt KTV68096 với chiều dài 1.6m, chiều rộng 40cm phù hợp với đa phần không gian và mọi thiết bị có thể vừa làm kệ tivi vừa làm tủ trang trí đều rất đẹp mắt. Chất liệu chính là gỗ cao su tiêu chuẩn AA dày 17mm sơn PU hoàn thiện màu sắc đẹp kết hợp cửa kính trong cùng các hệ hộc kéo và ngăn mở sẽ giúp không gian nhà bạn thêm đẹp hơn. Chân sắt sơn tĩnh điện chống rỉ sét đảm bảo độ bền cao cũng như tính thẩm mỹ cho sản phẩm.', '0', 'việt nam', 'màu cánh gián', '120x60x75cm', '0', 1, 0, '1', 0);
INSERT INTO `products` VALUES (54, 'Kệ tivi có ngăn kéo gỗ cao su chân sắt KTV68095', 3600000, 2880000, 'Kệ tivi có ngăn kéo gỗ cao su chân sắt KTV68095 với chiều dài 1.6m, chiều rộng 40cm phù hợp với đa phần không gian và mọi thiết bị có thể vừa làm kệ tivi vừa làm tủ trang trí đều rất đẹp mắt. Chất liệu chính là gỗ cao su tiêu chuẩn AA dày 17mm sơn PU hoàn thiện màu sắc đẹp kết hợp các hệ hộc kéo và ngăn mở sẽ giúp không gian nhà bạn thêm đẹp hơn. Chân sắt sơn tĩnh điện chống rỉ sét đảm bảo độ bền cao cũng như tính thẩm mỹ cho sản phẩm.', '0', 'việt nam', 'màu tự nhiên', '160x40x50cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (55, 'Kệ tivi gỗ tự nhiên cửa mây chân sắt KTV68100', 3200000, 2560000, 'Kệ tivi gỗ tự nhiên cửa mây chân sắt KTV68100 với chất liệu gỗ cao su tiêu chuẩn AA dày 17mm sơn PU hoàn thiện màu sắc sang trọng kết hợp với cửa mây nhựa màu trắng làm điểm nhấn. Kệ dài 1.4m phù hợp với mọi không gian phòng khách hay phòng ngủ, thiết kế với cửa mở và hộc kéo tiện lợi, tăng khả năng lưu trữ độ đạc. Hình ảnh thực tế màu sơn pu gỗ góc chó sang trọng, bên cạnh đó quý khách có thể đặt màu theo yêu cầu. ', '0', 'việt nam', 'màu gỗ tự nhiên', '140x40x50cm', '0', 1, 4, '1', 0);
INSERT INTO `products` VALUES (56, 'Bàn bên sofa mặt đá khung sắt sơn tĩnh điện SST029', 1200000, 1050000, 'Bàn bên sofa mặt kính khung sắt SST029 sở hữu kiểu dáng tối giản, tinh tế với mặt bàn kính trong kết hợp cùng khung sắt sơn tĩnh điện màu đen phù hợp với mọi không gian phòng khách của căn hộ, chung cư, nhà phố... Bên cạnh đó, tab trang trí SST029 còn thiết kế thêm kệ lưới đựng sách, báo mang đến sự tiện lợi trong quá trình sử dụng.', '0', 'việt nam', 'màu cánh gián', '50x55cm', '0', 1, 0, '1', 0);
INSERT INTO `products` VALUES (57, 'Bàn bên sofa phòng khách gỗ sồi cao cấp STT030', 1650000, 1485000, 'Bàn bên sofa STT030 ý tưởng tuyệt vời để gia tăng thêm tiện ích, cũng như nét thẩm mỹ cho không gian phòng khách. Với tông màu nhẹ nhàng từ chất liệu gỗ sồi cao cấp, cùng đường vân gỗ sắc nét. Thật sự không quá khó để chiếc bàn bên sofa STT030 làm nổi bật góc phòng khách, tôn lên cá tính riêng của bạn. Đặt một chiếc bàn bên sofa cũng là cách gia tăng tiện ích, giúp căn phòng có thêm không gian lưu trữ và trang trí.', '0', 'việt nam', 'màu gỗ tự nhiên', '46x52,5 cm ', '0', 1, 0, '1', 0);
INSERT INTO `products` VALUES (58, 'Bàn bên sofa gỗ sồi mặt kính hiệu ứng cao cấp STT031', 1850000, 1665000, 'Bàn bên sofa STT031 ý tưởng tuyệt vời để gia tăng thêm tiện ích, cũng như nét thẩm mỹ cho không gian phòng khách. Với tông màu nhẹ nhàng từ chất liệu gỗ sồi cao cấp, cùng đường vân gỗ sắc nét. Thật sự, không quá khó để chiếc bàn bên sofa STT031 làm nổi bật góc phòng khách, tôn lên cá tính riêng của bạn. Đặt một chiếc bàn bên sofa cũng là cách gia tăng tiện ích, giúp căn phòng có thêm không gian lưu trữ và trang trí.', '0', 'việt nam', 'màu cánh gián', '46x52,5 cm', '0', 1, 0, '1', 0);
INSERT INTO `products` VALUES (59, 'Tủ Gỗ Kệ Ngăn MOHO VIENNA 201 2 Màu', 2790000, 2790000, 'VIENNA là niềm ao ước đặt chân đến của nhiều người bởi nó là thủ đô nổi tiếng bậc nhất về sự lộng lẫy của các tòa lâu đài nguy nga, tráng lệ. Đây là nguồn cảm hứng cho bộ sưu tập nội thất VIENNA, nhờ vậy mà các sản phẩm thuộc bộ sưu tập này đều mang nét hiện đại của thủ đô nước Áo.\r\n\r\nKiểu dáng tối giản, hiện đại\r\n\r\nVới màu sắc và lối thiết kế đơn giản dễ kết hợp các mẫu nội thất khác nhưng lại mang đến không gian hiện đại và sang trọng.\r\n\r\nTối ưu hóa không gian lưu trữ\r\n\r\nVới 5 kệ ngăn giúp lưu trữ một cách linh hoạt, giúp không gian gọn gàng, ngăn nắp', 'MFWRCA901.W05', 'Việt Nam', 'Màu trắng', 'Dài 50cm x Rộng 60cm x Cao 2m1', 'Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV', 1, 2, '2', 0);
INSERT INTO `products` VALUES (60, 'Tủ Đa Ngăn Donica', 4400000, 4490000, 'Thiết kế lớn, vững chắc: Tủ đa ngăn Donica sở hữu kích thước rộng với chiều dài lên đến 1.5m, sản phẩm sở hữu kết cấu vững chắc có thể chứa đựng nhiều vật nặng.\r\n\r\nTủ đa năng: Với thiết kế đơn giản, tủ có thể dùng cho nhiều mục đích khác nhau như là tủ đồ, tủ quần áo, tủ kệ tivi, tủ giày.', 'STMADMADDONIWID1.0081', 'Việt Nam', 'Đá Xanh', 'Dài 797mm x Rộng 450mm x Cao 1500mm', 'Gỗ công nghiệp MDF chuẩn CARP-B2 (*)', 1, 2, '1 năm', 0);
INSERT INTO `products` VALUES (61, 'Tủ Kệ Tivi Gỗ MOHO ODENSE 601', 7500000, 7990000, 'Kệ tivi có 02 cánh trượt\r\nVới thiết kế theo phong cách VINTAGE cánh cửa của kệ tivi ODENSE được thiết kế cánh trượt để thu nhỏ diện tích đóng mở và 2 hộc kéo tiện lợi.', 'MFTCCBN01.B16MFTCCA901.N16', 'Việt Nam', 'Cam đất', 'Dài 160cm x Rộng 40cm x Cao 50cm', 'Gỗ công nghiệp MFC/PB đạt chuẩn CARP-B2', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (62, 'Tủ Kệ Tivi Gỗ MOHO VLINE 301', 3800000, 3990000, 'Ngăn kệ rộng rãi thoải mái khi lưu trữ\r\n\r\nTủ có một ngăn tủ lớn cùng 2 ngăn kệ nhỏ tạo điểm nhấn sang trọng, hiện đại, từng chi tiết đẹp tinh tế, và phục vụ nhu cầu cất trữ đồ và trang trí các vật dụng gia đình khác.', 'MFTCCA901.N16', 'Việt Nam', 'Tự nhiên', 'Dài 160cm x Rộng 41cm x Cao 51cm', 'Gỗ công nghiệp PB chuẩn CARB-P2 (*), Veneer gỗ sồ tự nhiên', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (63, 'Tủ Kệ Tivi Gỗ Tràm MOHO VLINE 301', 3800000, 3900000, 'Ngăn kệ rộng rãi thoải mái khi lưu trữ\r\n\r\nTủ có một ngăn tủ lớn cùng 2 ngăn kệ nhỏ tạo điểm nhấn sang trọng, hiện đại, từng chi tiết đẹp tinh tế, và phục vụ nhu cầu cất trữ đồ và trang trí các vật dụng.', 'MFTCCA901.B16', 'Việt Nam', 'Nâu', 'Dài 160cm x Rộng 41cm x Cao 51cm', 'Gỗ tràm, veneer tràm', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (64, 'Tủ Đầu Giường Gỗ MOHO MALAGA 302', 1400000, 1490000, 'Thiết kế nhỏ gọn, tinh tế\r\nTủ đầu giường MALAGA mang đến điểm nhấn thu hút cho không gian nội thất phòng ngủ.', 'MFBSCAO02.N05', 'Việt Nam', 'Nâu', 'Dài 41cm x Rộng 50 cm x Cao 51,5cm', 'Gỗ công nghiệp PB, MDF chuẩn CARB-P2 (*)', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (65, 'Tủ Đầu Giường Gỗ MOHO VLINE 801 Màu Tự Nhiên', 1700000, 1790000, 'Thiết kế nhỏ gọn, tinh tế\r\n\r\nLấy cảm hứng từ nét đẹp Việt pha lẫn chút hiện đại, mang đến điểm nhấn thu hút cho không gian nội thất phòng ngủ.', 'MFBSCA802.N05', 'Việt Nam', 'Tự nhiên', 'Dài 55cm x Rộng 41cm x Cao 51,5cm', 'Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Veneer gỗ sồi tự nhiên', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (66, 'Tủ Đầu Giường Gỗ Mây Mắt Cáo MOHO FIJI 401', 1900000, 1990000, 'Thiết kế phong cách Tropical\r\n\r\nTủ đầu giường FIJI được thiết kế tối giản kết hợp với vẻ đẹp của chất liệu mây đan tự nhiên chắc chắn sẽ thổi thêm nét xanh và mang đến cho không gian nội thất phòng ngủ của bạn vẻ đẹp Á Đông mới. Bạn có thể cảm nhận sự tươi mới như đang thong dong giữa một cánh rừng xanh mát bất tận.\r\n\r\nNgoài ra, tủ đầu giường FIJI còn là một lựa chọn tuyệt vời cho những ai yêu thích sự tự nhiên của phong cách Tropical có thể kết hợp cùng giường ngủ, tủ quần áo, ghế sofa.\r\n\r\n', 'MFBSCB801.B55', 'Việt Nam', 'Nâu', 'Dài 50cm x Rộng 45cm x Cao 50.5cm', 'Gỗ công nghiệp PB chuẩn CARB-P2 (*)', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (67, 'Hộc Tủ 3 Ngăn Lưu Trữ Tài Liệu Có Khóa MOHO WORKS 201', 1700000, 1790000, '3 tầng lưu trữ\r\n\r\nMặc dù tủ có thiết kế nhỏ gọn nhưng vẫn được thiết kế có 3 tầng để sắp xếp, phân loại và lưu trữ hồ sơ. Vừa vặn với giấy tờ có kích thước A4.', 'MFBSCA802.N07', 'Việt Nam', 'Trắng', 'Dài 35cm x Rộng 42cm x Cao 63cm ', 'Gỗ công nghiệp PB cao cấp chuẩn CARB-P2 (*), sơn phủ UV', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (68, 'Tủ Giày – Tủ Trang Trí Gỗ MOHO VIENNA 201', 2400000, 2500000, 'Tối ưu ngăn lưu trữ\r\n\r\nTủ Giày - Tủ Trang Trí Gỗ MOHO VIENNA được thiết kế với nhiều tầng ngăn tiện lợi và thoáng khí. Tủ đựng giày có không gian lưu trữ lớn  từ 15 - 20 đôi giày, dép cho cả gia đình. Ngoài ra bạn có thể thay đổi kích thước kệ ngăn, phù hợp chứa đựng các món đồ khác như mũ bảo hiểm, ô dù, áo mưa... \r\n\r\n', 'MFBSCA802.N05', 'Việt Nam', 'Tự nhiên', 'Dài 55cm x Rộng 41cm x Cao 51,5cm', 'Gỗ công nghiệp MDF chuẩn CARB-P2 (*), Veneer gỗ sồi tự nhiên', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (69, 'Tủ Giày – Tủ Trang Trí Gỗ MOHO OSLO 901', 2490000, 2520000, 'Tủ đựng giày dép có thể sử dụng đa chức năng\r\nThiết kế bắt mắt của tủ không chỉ được sử dụng để đựng giày dép mà còn là tủ trang trí tạo nên không gian nội thất phòng khách sang trọng, dễ dàng thu hút ánh nhìn và phù hợp với nhiều diện tích không gian khác nhau của gia đình.', 'MFSHCA601.N08', 'Việt Nam', 'Tự nhiên', 'Dài 80cm x Rộng 36cm x Cao 92cm', 'Gỗ công nghiệp PB chuẩn CARB-P2 (*), Sơn phủ UV', 1, 2, '2 năm', 0);
INSERT INTO `products` VALUES (70, 'Đèn chùm hiện đại CCH-3743-15', 2900000, 2900000, 'Đèn hiện đại là sản phẩm được nhiều người ưa chuộng, yêu thích bởi những ưu điểm nổi bật kết hợp với công năng sử dụng tốt nhất khiến cho dòng sản phẩm đèn trang trí hiện đai trở thành xu hướng mua sắm tốt nhất của thời đại 4.0. Trong đó, mẫu đèn chùm hiện đại CCP-3743-15 là sự lựa chọn hoàn hảo, phù hợp với những người theo xu hướng hiện đại và hãy đồng hành cùng Casani để cùng tìm hiểu nhé.', 'CCH-3743-15', 'Việt Nam', 'Vàng', 'D800xH300mm', 'Hợp kim mạ màu vàng , chao thủy tinh', 1, 3, '1 năm', 0);
INSERT INTO `products` VALUES (71, 'Đèn chùm thả hiện đại CCH-5620-15', 2300000, 2500000, 'Đèn chùm thả hiện đại CCH-5620-15 của Casani sẽ là điểm nhấn ấn tượng cho phòng khách của bạn thêm sang trọng và mới mẻ hơn. Ánh sáng dù là tự nhiên hay nhân tạo vẫn luôn luôn mang lại sự thay đổi tích cực nhất, giúp không gian căn phòng, ngôi nhà của bạn thêm thu hút và bắt mắt.', 'CCH-5620-15', 'Việt Nam', 'Vàng', 'D900*430mm', 'Khung hợp kim & chao thủy tinh', 1, 3, '1 năm', 0);
INSERT INTO `products` VALUES (72, 'Đèn Tường Hiện Đại CDT-2522', 700000, 800000, 'Đèn Tường Hiện Đại CDT-2522 cao cấp được sử dụng với tiêu chí đem lại nguồn ánh sáng bổ trợ cho các loại đèn chiếu sáng chính giúp tô điểm, làm nổi bật những góc khuất, khu vực mà ánh sáng chính còn bỏ sót.', 'CDT-2522', 'Việt Nam', 'Vàng', '22*60cm', 'Bóng: đui xoáy', 1, 3, '1 năm', 0);
INSERT INTO `products` VALUES (73, 'Đèn mâm pha lê CMT1718-800', 6900000, 7200000, 'Có thể nói những mẫu đèn mâm pha lê đang chiếm được rất nhiều niềm tin yêu của khách hàng, khẳng định vị thế số 1 trong phân khúc đèn trang trí đẹp tại Hà Nội. Tiếp nối sự thành công đó, hôm nay chúng tôi giới thiệu cho bạn một mẫu sản phẩm hoàn toàn mới có mã CMT1718-800. Với vẻ đẹp đặc trưng, chắc chắn đây là mẫu sản phẩm đáng để bạn dành sự quan tâm cho nó.', 'CMT1718-800', 'Việt Nam', 'Trắng -Vàng- Trung tính', 'D80*H40CM', 'Mâm inox kết hợp pha lê', 1, 3, '2 năm', 0);
INSERT INTO `products` VALUES (74, 'Đèn mâm pha lê áp trần MTK-103V', 5200000, 5600000, 'Có thể nói những mẫu đèn mâm pha lê đang chiếm được rất nhiều niềm tin yêu của khách hàng, khẳng định vị thế số 1 trong phân khúc đèn trang trí đẹp tại Hà Nội. Tiếp nối sự thành công đó, hôm nay chúng tôi giới thiệu cho bạn một mẫu sản phẩm hoàn toàn mới có mã CMT1718-800. Với vẻ đẹp đặc trưng, chắc chắn đây là mẫu sản phẩm đáng để bạn dành sự quan tâm cho nó.', 'MTK-103V', 'Việt Nam', 'Vàng', 'D80*H40CM', 'Mâm inox, quả phale', 1, 3, '2 năm', 0);
INSERT INTO `products` VALUES (75, 'Đèn mâm ốp trần cho bé CMB-1940', 1200000, 1290000, 'Kích thích trí tượng tượng, sáng tạo cho bé với thiết kế ngộ nghĩnh, đáng yêu.\r\nNhư quý khách đã biết, các bé thường hay thích những đồ vật có thiết kế đáng yêu, ngộ nghĩnh. Hiểu được điều đó, chúng tôi đem đến cho quý khách một sản phẩm đèn mâm ốp trần với một thiết kế vô cùng tinh tế, bắt mắt tạo cảm giác thơ mộng dễ thương giúp bé có thêm hứng thú và kích thích trí tưởng tượng và khả năng sáng tạo của mình.', 'CMB-1940', 'Việt Nam', 'Trắng -Vàng- Trung tính', 'D500xH500mm', 'khung hợp kim kết hợp cùng mika', 1, 3, '2 năm', 0);
INSERT INTO `products` VALUES (76, 'Đèn chùm hiện đại CCH-3759-60', 5800000, 6000000, 'Thiết kế nổi bật, ấn tượng\r\nĐèn chùm trang trí hiện đại CCH-3759-60 sở hữu thiết kế đầy độc đáo, quyến rũ, thu hút mọi ánh nhìn. Điểm nhấn ấn tượng của mẫu đèn này nằm ở những viên pha lê trong suốt như những giọt nước được gắn với nhau rủ xuống như những dòng nước. Khi ánh đèn led bật lên, những viên pha lê ấy càng trở nên lung linh, bắt mắt. Một vẻ đẹp độc đáo, tinh tế và vô cùng sang trọng mang đến cho cả không gian.', 'CCH-3579-60', 'Việt Nam', 'Vàng ( có thể thay bóng 3 mầu )', 'D600 x H550mm', 'Khung hợp kim, dây hạt pha lê', 1, 3, '2 năm', 0);
INSERT INTO `products` VALUES (77, 'Đèn chùm pha lê hiện đại CCH-3621-60', 5500000, 5700000, 'Hầu hết các loại đèn pha lê hiện đại đều được sản suất không chỉ thoãn mãn nhu cầu và thắp sáng mà còn dùng để làm đẹp cho nội thất, góp phần làm đẹp cho không gian thêm sang trọng và ấn tượng. Dòng sản phẩm này có tính phân cấp rất hợp lí, chúng luôn được tạo điểm nhấn nhờ vào những chùm bóng phát ra ánh sang lộng lẫy,hoàn mỹ phù hợp với những không gian sang trọng.', 'CCH-3621-60', 'Việt Nam', 'Vàng ( có thể thay bóng 3 mầu )', 'D600mm*450mm', 'Khung hợp kim & pha lê khói trắng', 1, 3, '2 năm', 0);
INSERT INTO `products` VALUES (78, 'Đèn Tường Hiện Đại CDT-2648', 5000000, 5800000, 'Phù hợp: Phòng khách, phòng ngủ, nhà hàng, khách sạn....', 'CDT-2648', 'Việt Nam', 'Vàng ( có thể thay bóng 3 mầu )  ', '170*540mm', 'Hợp kim & pha lê ', 1, 3, '1 năm', 0);
INSERT INTO `products` VALUES (79, 'Đèn gắn tường hành lang phong cách Retro ZXL6836', 1693000, 1796000, 'Đèn gắn tường hành lang phong cách Retro ZXL6836 là đèn tường được thiết kế theo phong cách công nghiệp Retro độc đáo, đẹp mắt. Đèn có khung bằng thép cao cấp với 2 màu sắc đẹp mắt cho bạn thoải mái lựa chọn, chao đèn thủy tinh trong suốt tinh tế. Sản phẩm sẽ giúp tăng tính thẩm mỹ cho không gian trang trí cá nhân bạn.\r\n\r\nĐèn gắn tường hành lang phong cách Retro ZXL6836 là lựa chọn phụ hợp các công trình hiện đại, đèn ứng dụng vào đèn treo tường cầu thang, phòng ngủ, phòng khách và các khu vực chức năng khác nhau.', 'ZXL6836', 'Việt Nam', 'Ánh sáng ấm\r\n\r\n', '20*50', 'Thép cao cấp, Thuỷ tinh', 1, 3, '2 năm', 0);
INSERT INTO `products` VALUES (80, 'Giường Ngủ Gỗ Tràm MOHO MALAGA 302 1m2', 3490000, 3580000, 'Thành phố MALAGA ngập tràn ánh sáng mặt trời, lắng đọng chút yên bình của khung cảnh chim bồ câu trên những cây ngô đồng tại quảng trường chính là nguồn cảm hứng tạo thiết kế cho bộ sưu tập nội thất MALAGA. \r\nKiểu dáng thiết kế tối giản\r\nVới lối thiết kế tối giản và tone màu nâu trầm giúp cho giường ngủ MALAGA dễ dàng kết hợp với các nội thất khác.\r\n\r\nTông màu nâu trầm', 'MFBNCA502.N12', 'Việt Nam', 'Nâu', 'Dài 200cm x Rộng 120cm', 'Gỗ tràm tự nhiên', 1, 5, '2 năm', 0);
INSERT INTO `products` VALUES (81, 'Giường Ngủ Gỗ MOHO VLINE 601 Nhiều Kích Thước', 4990000, 5200000, 'Giường ngủ có đa dạng kích thước\r\nGiường ngủ gỗ VLINE có kích thước đa dạng chiều khác nhau tùy theo nhu cầu mua sắm của bạn, kích thước phù hợp với các loại nệm tiêu chuẩn (1m2 x 2m, 1m4 x 2m, 1m6 x 2m, 1m8 x 2m) giúp cho việc lựa chọn và mua sắm của bạn trở nên dễ dàng hơn.', 'MFBNCA804.N12', 'Việt Nam', 'Tự nhiên', 'Dài 212cm x Rộng 136/156/176/196cm x Cao đến đầu giường 92cm', 'Gỗ tràm tự nhiên, Veneer gỗ sồi tự nhiên', 1, 5, '2 năm', 0);
INSERT INTO `products` VALUES (82, 'Giường Ngủ Gỗ Cao Su MOHO NEXO 301 Màu Nâu', 8490000, 8600000, 'Thiết kế đầu giường độc đáo\r\nGiường Nexo có phần tựa lưng được thiết kế độc đáo với đường bo góc đặc biệt để ngồi đọc sách hoặc xem TV. Phần gỗ nổi lên ở 2 đỉnh đầu giường được uốn cong tỉ mỉ, không tạo ra sự thừa thãi mà còn giúp tạo nên một điểm nhấn thiết kế trang nhã hơn cả.', 'MFBNCBD03.B16', 'Việt Nam', 'Nâu', '169cm X 222cm X 90cm', 'Gỗ cao su tự nhiên, MDF Veneer tràm chuẩn CARB-P2', 1, 5, '2 năm', 0);
INSERT INTO `products` VALUES (83, 'Giường Ngủ Bọc Nệm MOHO SKJEBERG 801 Màu Tự Nhiên', 8500000, 8600000, 'Các món đồ gỗ nội thất trong bộ sưu tập này đều được lấy cảm hứng từ sự yên bình và không khí ấm áp của quận SKJEBERG – Na Uy, các sản phẩm mang đậm phong cách Scandinavian hứa hẹn sẽ đem đến cho bạn cảm giác thư giãn, thoải mái trong chính tổ ấm thân yêu của mình.', 'MFBNCBN01.N16', 'Việt Nam', 'Tự nhiên', '172cm X 200cm X 90cm', 'Gỗ cao su tự nhiên, vải Polyester Canvas', 1, 5, '2 năm', 0);
INSERT INTO `products` VALUES (84, 'Giường Ngủ Gỗ Tràm MOHO HOBRO 301', 8500000, 8700000, 'Kiểu dáng có thiết kế độc đáo, mới lạ\r\nNhững đường veneer đan xéo được các thợ thủ công lành nghề khéo léo ghép 1 cách tỉ mỉ và chỉnh chu đã tạo ra điểm nhấn vô cùng độc đáo ở phần đầu và thân giường HOBRO.\r\n\r\nNghệ thuật hình học: Sử dụng veneer tràm đặc biệt với kỹ thuật dán cao cấp tạo ra hiệu ứng 3D hình học đối xứng nhau.\r\n\r\nHiệu ứng màu sắc 3D: Với các đường veneer đan xen và đối xứng nhau đã tạo nên một sắc màu tổng thể có thể thay đổi tùy vào mỗi góc nhìn khác nhau. Khi nhìn chính diện sẽ thấy sự đối lập hoàn toàn giữa 2 màu veneer nhưng nhìn chéo sẽ thấy màu sắc giữa 2 mảng đối xứng gần dần dần tương đồng.', 'MFBNCBD01.B16', 'Việt Nam', 'Tự nhiên', '210cm x Rộng 171/191cm', 'Gỗ tràm tự nhiên/ MDF veneer tràm', 1, 5, '2 năm', 0);
INSERT INTO `products` VALUES (85, 'Bàn cụm 2 liền kệ 5 tầng gỗ cao su khung sắt lắp ráp TK071', 5200000, 5200000, 'Bàn cụm 2 người TK071 có thiết kế liền kệ để đồ, giúp mở rộng không gian lưu trữ đồ và tăng tính thẩm mỹ cho không gian văn phòng. Với mặt bàn được sử dụng chất liệu gỗ cao su tiêu chuẩn AA, tiêu chuẩn xuất khẩu, có vân gỗ đẹp, có độ dày 17cm chịu lực tốt. Hệ chân bàn sắt lắp ráp linh hoạt, sử dụng cơ cấu ngàm dễ sử dụng, liên kết chắc chắn và ổn định, bề mặt khung chân được phủ lớp sơn tĩnh điện chất lượng, đem lại độ bền bỉ và đẹp mắt.\r\n\r\nMặt bàn kích thước 120x120cm, diện tích mỗi người sử dụng là 120x60cm đây là kích thước tiêu chuẩn cho bàn làm việc đơn một người ngồi. Chiều cao tiêu chuẩn bàn làm việc 75cm phù hợp với hầu hết các ghế văn phòng hiện nay.', 'TK071', 'Việt Nam', 'Mặt bàn melamin vân tối. Khung chân sắt sơn tĩnh điện đen hoặc trắng', '120x150x140 (cm)', 'Gỗ cao su AA dày 17mm. Chân sắt hộp vuông 25x25mm cơ cấu lắp ráp chắc chắn, linh hoạt.', 1, 6, '1 năm', 0);
INSERT INTO `products` VALUES (86, 'Bàn làm việc 120x60cm hệ OMA II gỗ cao su lắp ráp ngàm HBOM202', 1435000, 1435000, 'Bàn làm việc 120x60cm HBOM202 thuộc hệ bàn OMA II có đặc điểm khung chân sắt lắp ráp với chân trụ được làm từ sắt tròn toát lên vẻ đẹp mềm mại, tinh tế nhưng không kém phần chắc chắn và tiện lơi khi có thể tháo lắp, giúp việc di dời dễ dàng hơn. Kết hợp với khung chân sắt là mặt bàn gỗ cao su tiêu chuẩn AA sơn PU màu sắc đẹp mắt, bề mặt được sử lý chống thấm nước, chống cong vênh đảm bảo độ bền cao.', 'HBOM202', 'Việt Nam', 'Cánh gián', 'Chân trụ sắt tròn phi 42mm sắt dày 1.2mm, giăng trên sắt 60x30mm dày 1.2mm', 'Gỗ cao su AA dày 17cm, tiêu chuẩn xuất khẩu, sơn phủ PU chống thấm', 1, 6, '1 năm', 0);
INSERT INTO `products` VALUES (87, 'Kệ để tài liệu hồ sơ văn phòng bằng gỗ THS68066', 1700000, 1700000, 'Với một kiểu dáng dáng đơn giản và hiện đại, mẫu kệ hồ sơ THS6866 là sự lựa chọn tuyệt vời giúp giúp đánh thức trí tưởng tượng và óc sáng tạo của bạn. Kệ hồ sơ THS68066 được bố trí 5 ngăn để đồ khá rộng rãi. Nếu có nhiều ý tưởng trang trí cho không gian làm việc, bạn có thể bố trí thêm 2 hoặc 3 chiếc kệ hồ sơ THS6866 để có thêm ngăn lưu trữ, đồng thời giúp trang trí cho nội thất văn phòng. Đây là dòng kệ đơn giản và gọn nhẹ, rất phù hợp sử dụng để làm kệ văn phòng, kệ trang trí hoặc có thể là kệ sách cho phòng làm việc.', 'THS68066', 'Việt Nam', 'Tự nhiên', '70x70x30cm', 'Gỗ cao su tiêu chuẩn AA, sơn PU / Chân sắt sơn tĩnh điện', 1, 6, '1 năm', 0);
INSERT INTO `products` VALUES (88, 'Ghế văn phòng lưng lưới chân sắt mạ MFJ118', 990000, 990000, 'Ghế văn phòng lưng lưới chân sắt mạ MFJ118 với phần lưng ghế khung nhựa bọc lưới kết hợp với nệm ngồi bọc vải lưới cao cấp, có độ đàn hồi cho cảm giác ngồi rất êm ái kết hợp khung chân sắt mạ crome sáng bóng, chịu lực tốt. Kiểu dáng đơn giản, gam màu đen chủ đạo phù hợp với nhiều mục đích sử dụng trong các không gian khác nhau.', 'MFJ118', 'Việt Nam', 'Đen', '70*50', 'Nhựa cao cấp bọc lưới thoáng khí', 1, 6, '1 năm', 0);
INSERT INTO `products` VALUES (89, 'Ghế công thái học lưng lưới cao cấp màu đen SP-668SJ-1', 3990000, 3990000, 'Ghế công thái học Ergonomic lưng lưới SP-668SJ-1 là mẫu ghế được thiết kế theo tiêu chuẩn Ergonomic công thái học phân khúc tầm trung với kiểu dáng hiện đại, kích thước tương đối phù hợp với hầu hết không gian làm việc hiện nay từ văn phòng đến nhà ở. Lưng ghế cao thiết kế với tạo hình gồm 2 khối đệm bọc lưới uốn cong theo hình gơn sóng ôm gọn vùng xương vai và nâng đỡ cột sống lưng, mang lại tư thế ngồi dễ chịu. Đệm ngồi bọc lưới kết cấu chuẩn vừa vặn với khung xương chậu, kết hợp mặt ghế hơi dốc về phía sau nên khi ngồi không bị trượt về phía trước, giúp cố định dáng ngồi thẳng.', 'SP-668SJ-1', 'Việt Nam', 'Đen', '70*120', 'Khung nhựa cao cấp đảm bảo độ chắc chắn và độ bền cao. Lưng tựa bọc lưới thoáng khí phù hợp với khí hậu Việt Nam.', 1, 6, '1 năm', 0);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id_role` int NULL DEFAULT NULL,
  `id_permiss` int NULL DEFAULT NULL,
  INDEX `idx_roleid`(`id_role` ASC) USING BTREE,
  INDEX `idx_permissionid`(`id_permiss` ASC) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`id_permiss`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (8, 1);
INSERT INTO `role_permission` VALUES (8, 2);
INSERT INTO `role_permission` VALUES (8, 3);
INSERT INTO `role_permission` VALUES (8, 24);
INSERT INTO `role_permission` VALUES (3, 10);
INSERT INTO `role_permission` VALUES (3, 11);
INSERT INTO `role_permission` VALUES (3, 12);
INSERT INTO `role_permission` VALUES (3, 30);
INSERT INTO `role_permission` VALUES (4, 25);
INSERT INTO `role_permission` VALUES (4, 26);
INSERT INTO `role_permission` VALUES (5, 4);
INSERT INTO `role_permission` VALUES (5, 5);
INSERT INTO `role_permission` VALUES (5, 6);
INSERT INTO `role_permission` VALUES (5, 15);
INSERT INTO `role_permission` VALUES (6, 13);
INSERT INTO `role_permission` VALUES (6, 21);
INSERT INTO `role_permission` VALUES (7, 20);
INSERT INTO `role_permission` VALUES (2, 28);
INSERT INTO `role_permission` VALUES (2, 29);
INSERT INTO `role_permission` VALUES (2, 18);
INSERT INTO `role_permission` VALUES (2, 19);
INSERT INTO `role_permission` VALUES (2, 14);
INSERT INTO `role_permission` VALUES (9, 16);
INSERT INTO `role_permission` VALUES (9, 17);
INSERT INTO `role_permission` VALUES (1, 1);
INSERT INTO `role_permission` VALUES (1, 2);
INSERT INTO `role_permission` VALUES (1, 3);
INSERT INTO `role_permission` VALUES (1, 4);
INSERT INTO `role_permission` VALUES (1, 5);
INSERT INTO `role_permission` VALUES (1, 6);
INSERT INTO `role_permission` VALUES (1, 10);
INSERT INTO `role_permission` VALUES (1, 11);
INSERT INTO `role_permission` VALUES (1, 12);
INSERT INTO `role_permission` VALUES (1, 13);
INSERT INTO `role_permission` VALUES (1, 14);
INSERT INTO `role_permission` VALUES (1, 15);
INSERT INTO `role_permission` VALUES (1, 16);
INSERT INTO `role_permission` VALUES (1, 17);
INSERT INTO `role_permission` VALUES (1, 18);
INSERT INTO `role_permission` VALUES (1, 19);
INSERT INTO `role_permission` VALUES (1, 20);
INSERT INTO `role_permission` VALUES (1, 21);
INSERT INTO `role_permission` VALUES (1, 22);
INSERT INTO `role_permission` VALUES (1, 23);
INSERT INTO `role_permission` VALUES (1, 25);
INSERT INTO `role_permission` VALUES (1, 26);
INSERT INTO `role_permission` VALUES (1, 27);
INSERT INTO `role_permission` VALUES (1, 28);
INSERT INTO `role_permission` VALUES (1, 29);
INSERT INTO `role_permission` VALUES (1, 30);
INSERT INTO `role_permission` VALUES (1, 24);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`, `title`) USING BTREE,
  UNIQUE INDEX `title`(`title` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin');
INSERT INTO `roles` VALUES (22, 'người dùng');
INSERT INTO `roles` VALUES (9, 'quản lý danh mục sản phẩm');
INSERT INTO `roles` VALUES (2, 'quản lý đơn hàng');
INSERT INTO `roles` VALUES (6, 'quản lý kho');
INSERT INTO `roles` VALUES (4, 'quản lý log');
INSERT INTO `roles` VALUES (5, 'quản lý quyền');
INSERT INTO `roles` VALUES (8, 'quản lý sản phẩm');
INSERT INTO `roles` VALUES (7, 'quản lý thông tin website');
INSERT INTO `roles` VALUES (3, 'quản lý user');

-- ----------------------------
-- Table structure for slideimg
-- ----------------------------
DROP TABLE IF EXISTS `slideimg`;
CREATE TABLE `slideimg`  (
  `slider_id` int NOT NULL AUTO_INCREMENT,
  `slider_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slider_active` int NULL DEFAULT NULL,
  PRIMARY KEY (`slider_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of slideimg
-- ----------------------------

-- ----------------------------
-- Table structure for transports
-- ----------------------------
DROP TABLE IF EXISTS `transports`;
CREATE TABLE `transports`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_order` int NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `leadTime` varbinary(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transports
-- ----------------------------
INSERT INTO `transports` VALUES ('0293179388e143c9bb0acb884b7a720b', 13, '04/05/2023', 0x30372F30352F32303233);
INSERT INTO `transports` VALUES ('0b47758fdba14d05b1eb173c78396083', 17, '04/05/2023', 0x30372F30352F32303233);
INSERT INTO `transports` VALUES ('1a456b5e296b4906a5923c6a5cd0b341', 19, '12/06/2023', 0x31352F30362F32303233);
INSERT INTO `transports` VALUES ('23bf55c0a95243fa83d6d581f5927a00', 16, '04/05/2023', 0x30372F30352F32303233);
INSERT INTO `transports` VALUES ('4bd64a48790a433f914716d1d7be1df5', 14, '04/05/2023', 0x30372F30352F32303233);
INSERT INTO `transports` VALUES ('b32c002cd209426eab4bfe8504d9f8e2', 18, '04/05/2023', 0x30372F30352F32303233);
INSERT INTO `transports` VALUES ('bfb9df49f70b4c4fbdad8b54d64b57d6', 23, '16/06/2023', 0x31392F30362F32303233);
INSERT INTO `transports` VALUES ('c6c7c2bef15b4361a7561c76b6fef41e', 12, '04/05/2023', 0x30372F30352F32303233);
INSERT INTO `transports` VALUES ('cc0a8c3bfaa44bad9a08312a81b5b4c7', 24, '21/06/2023', 0x32342F30362F32303233);
INSERT INTO `transports` VALUES ('dbd03e166cd947e18ae13b23f36a1af6', 25, '20/06/2023', 0x32332F30362F32303233);
INSERT INTO `transports` VALUES ('e4b49a0e006443bebd9bee2a32c5910d', 26, '13/06/2023', 0x31362F30362F32303233);
INSERT INTO `transports` VALUES ('ea90a77214fc4ab3a2b1d22af08eb0c7', 15, '04/05/2023', 0x30372F30352F32303233);
INSERT INTO `transports` VALUES ('efe7e4a2a5e04534af5f35bee88a19b7', 27, '17/06/2023', 0x32302F30362F32303233);
INSERT INTO `transports` VALUES ('f6e843b87efe48d98a1723fddd7ab769', 20, '12/06/2023', 0x31352F30362F32303233);
INSERT INTO `transports` VALUES ('ff739501d2e8429e9a01153923a7562a', 22, '13/06/2023', 0x31362F30362F32303233);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `uid` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone_num` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `enable` int NOT NULL,
  `num_log_in` int NULL DEFAULT NULL,
  PRIMARY KEY (`uid`, `user_name`) USING BTREE,
  INDEX `uid`(`uid` ASC) USING BTREE,
  INDEX `user_name`(`user_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (11, 'huyen', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 1, 'Nlu', NULL, '20130013@st.hcmuaf.edu.vn', NULL, 'nữ', 1, NULL);
INSERT INTO `users` VALUES (13, 'dung', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 1, 'lê đình quốc dũng', NULL, 'quocdungledinh@gmail.com', NULL, 'nam', 1, NULL);
INSERT INTO `users` VALUES (25, 'dung4', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'lê đình quốc dũng', '0355806119', 'quocdungledinh@gmail.com', 'KTX khu B ĐHQG, Đông Hòa, Dĩ An, Bình Dương', 'nam', 1, 2);
INSERT INTO `users` VALUES (26, 'dung6', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'lê đình quốc dũng', NULL, 'quocdungledinh@gmail.com', NULL, 'nam', 1, 6);
INSERT INTO `users` VALUES (30, 't4', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'test4', NULL, 'test@gmail.com', NULL, NULL, 1, NULL);
INSERT INTO `users` VALUES (34, 't8', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, NULL, NULL, '0', NULL, NULL, 1, NULL);
INSERT INTO `users` VALUES (35, 't9', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, NULL, NULL, '0', NULL, NULL, 1, NULL);
INSERT INTO `users` VALUES (38, 't12', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'ảo thật đấy', NULL, 'quocdungledinh@gmail.com', NULL, NULL, 2, NULL);
INSERT INTO `users` VALUES (40, 't14', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, NULL, NULL, 'quocdungledinh@gmail.com', NULL, NULL, 0, NULL);
INSERT INTO `users` VALUES (54, 'dung2', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'lê đình quốc dũng', NULL, 'quocdungledinh@gmail.com', NULL, 'nam', 1, 0);
INSERT INTO `users` VALUES (55, 'dung12', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'lê đình quốc dũng', '0355806119', 'quocdungledinh@gmail.com', '', 'nam', 1, 1);
INSERT INTO `users` VALUES (56, 'test1', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'lê đình quốc dũng', '', 'quocdungledinh@gmail.com', '', 'nam', 1, 0);
INSERT INTO `users` VALUES (57, 'admin', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 1, 'admin', '0333027154', 'quocdungledinh@gmail.com', NULL, 'nam', 1, NULL);
INSERT INTO `users` VALUES (58, 'datt', 'f0fce59379cc3c4e9e99a848f03e650373c1d6e62ae1a05644c86f8c6e502b9a', 0, 'Nguyễn Thành Đạt', '0867155409', 'ngthanh.dat1305@gmail.com', 'Thủ Đức', 'nam', 1, 0);
INSERT INTO `users` VALUES (59, 'Nguyễn Thành Đạt', 'b7a8240da0e4ee5e13794fbd7bacc168023592f17ea7830bae67e981c1ffd66d', 0, 'Nguyễn Thành Đạt', NULL, '20130013@st.hcmuaf.edu.vn', NULL, 'null', 0, 0);
INSERT INTO `users` VALUES (60, 'Lê Dũng', '1ec7c8606082177a116b3ea4446307eaa3d8936dd4f3da545fca6af8d7665ceb', 0, 'Lê Dũng', NULL, 'quocdungledinh@gmail.com', NULL, 'null', 0, 0);
INSERT INTO `users` VALUES (61, 'Thành Đạt Nguyễn', '71af45ad57e9219e5dd1260d70617a0e149e30fa75938127205eac83ed9b3909', 0, 'Thành Đạt Nguyễn', NULL, 'ngthanh.dat1305@gmail.com', NULL, 'null', 0, 0);
INSERT INTO `users` VALUES (62, 'ga la', '6bbc041675ca2df05887663d68e0162c285ce348fc9c7a3f6f09fc113ffd2bf2', 0, 'ga la', NULL, 'laga2134@gmail.com', NULL, 'null', 0, 0);
INSERT INTO `users` VALUES (63, 'dung5', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'lê đình quốc dũng', NULL, 'quocdungledinh@gmail.com', NULL, 'nam', 0, 0);
INSERT INTO `users` VALUES (64, 'usertest', 'c015bc9b6d57b9f1ca4fa1e2eaec1722f076c8a698476403b202d3db5edf6438', 0, 'Nguyễn Văn A', NULL, 'kieudiem.to2006@gmail.com', NULL, 'nam', 1, 2);
INSERT INTO `users` VALUES (65, 'test5', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'test5', NULL, 'quocdungledinh@gmail.com', NULL, 'nam', 0, 0);
INSERT INTO `users` VALUES (66, 'test9', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'test9', NULL, 'quocdungledinh@gmail.com', NULL, 'nam', 0, 0);
INSERT INTO `users` VALUES (67, 'testt1', 'dcba4dc5e7b929e71c6978efcf274cc40d280be701562c6c5b805c6491a5c824', 0, 'lê đình quốc dũng', NULL, 'quocdungledinh@gmail.com', NULL, 'nam', 1, 0);
INSERT INTO `users` VALUES (68, 'test10', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 0, 'test10', NULL, 'quocdungledinh@gmail.com', NULL, 'nam', 1, 0);
INSERT INTO `users` VALUES (69, 'tmdt2024', 'ed0d841fe3e187be315ff6d45c116d9271b5e1c713f541005998e93feeca552c', 1, 'Thương mại điện tử', '0123456789', 'rivasvow@gmail.com', 'Đại học Nông Lâm', 'nam', 1, 0);

-- ----------------------------
-- Table structure for verify
-- ----------------------------
DROP TABLE IF EXISTS `verify`;
CREATE TABLE `verify`  (
  `uid` int NOT NULL,
  `token` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `token_expiry` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uid`, `token`) USING BTREE,
  UNIQUE INDEX `token`(`token` ASC) USING BTREE,
  CONSTRAINT `verify_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of verify
-- ----------------------------
INSERT INTO `verify` VALUES (55, '53500934e5b6ca90ecd1354cd6cae964bbd38c0cac25d10032427624af8db256', '2023-04-20 17:15:33', '2023-04-21 17:15:33');
INSERT INTO `verify` VALUES (63, '14f8fd6b6e349ee65a0575da949b07bb0e579f8181aaac360248747846d02334', '2023-06-20 14:27:30', '2023-06-21 14:27:30');
INSERT INTO `verify` VALUES (65, '325ac0a926cabe47d099d6e5bd3a23450ec59289b954a1b0f6fa1cd327ded924', '2023-06-21 05:42:21', '2023-06-22 05:42:21');
INSERT INTO `verify` VALUES (66, 'cccc2f852807fd76012fd0aa774c388cd7a7801a4b0a63eb94f054f162637dee', '2023-06-21 05:47:49', '2023-06-22 05:47:49');

SET FOREIGN_KEY_CHECKS = 1;
