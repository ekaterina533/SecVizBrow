/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: secviz
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES
('eb62f574b24d');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `authors` text DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `journal` varchar(100) DEFAULT NULL,
  `doi` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `abstract` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `bib_file` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES
(52,'Trevis: A context tree visualization and analysis framework and its use for classifying performance failure reports','Adamoli, Andrea; Hauswirth, Matthias',2010,'','10.1145/1879211.1879224','','When developers profile their applications to identify performance problems, they normally use profilers producing calling context trees. A calling context tree (CCT) represents the caller-callee relationships of a program. A dynamically collected CCT provides method coverage information. The CCTs produced by profilers also include method hotness information. Trevis, our context tree visualization and analysis framework, allows users to visualize, compare, cluster, and intersect CCTs produced by profilers. We evaluate Trevis in the context of a novel profiling tool called FlyBy. FlyBy runs transparently on an end-user\'s computer and continuously samples the applications\' call stack. When the user perceives the application as sluggish, she presses a \"Was Slow!\" button to tell FlyBy to file a performance failure report. The report contains the CCT based on the call stack samples FlyBy gathered over the last few seconds before the user pressed the button. We show how Trevis allows us to visualize and classify FlyBy bug reports.','Lee2009.png','2025-06-07 15:49:56','2025-06-07 15:54:12',1,'Trevis_A_context_tree_visualization_and_analysis_f_Adamoli_Andrea_4d69a091.bib'),
(53,'{TimeTree}: Exploring Time Changing Hierarchies','Card, Stuart K.; Suh, Bongwon; Pendleton, Bryan A.; Heer, Jeffrey; Bodnar, John W.',2006,'','10.1109/VAST.2006.261450','','Intelligence analysis often involves the task of gathering information about an organization. Knowledge about individuals in an organization and their relationships, often represented as a hierarchical organization chart, is crucial for understanding the organization. However, it is difficult for intelligence analysts to follow all individuals in an organization. Existing hierarchy visualizations have largely focused on the visualization of fixed structures and can not effectively depict the evolution of a hierarchy over time. We introduce TimeTree, a novel visualization tool designed to enable exploration of a changing hierarchy. TimeTree enables analysts to navigate the history of an organization, identify events associated with a specific entity (visualized on a TimeSlider), and explore an aggregate view of an individual\'s career path (a CareerTree). We demonstrate the utility of TimeTree by investigating a set of scenarios developed by an expert intelligence analyst. The scenarios are evaluated using a real dataset composed of eighteen thousand career events from more than eight thousand individuals. Insights gained from this analysis are presented.','Huang2009.png','2025-06-07 15:50:02','2025-06-07 15:53:40',1,'TimeTree_Exploring_Time_Changing_Hierarchies_Card_Stuart_K_6be971b8.bib'),
(54,'Extending the utility of treemaps with flexible hierarchy','Chintalapani, Gouthami; Plaisant, Catherine; Shneiderman, Ben',2004,'','10.1109/IV.2004.1320166','','Treemaps are a visualization technique for presenting hierarchical information on two-dimensional displays. Prior implementations limit the visualization to pre-defined static hierarchies. Flexible hierarchy, a new capability of Treemap 4.0, enables users to define various hierarchies through dynamically selecting a series of data attributes so that they can discover patterns, clusters and outliers. This work describes the design and implementation issues of flexible hierarchy. It then reports on a usability study, which led to enhancements to the interface.','Elzen2011.png','2025-06-07 15:50:08','2025-06-07 15:53:25',1,'Extending_the_utility_of_treemaps_with_flexible_hi_Chintalapani_Gouthami_2e8f6135.bib'),
(55,'A Self-adaptive Treemap-based Technique for Visualizing Hierarchical Data in {3D}','Chaudhuri, Abon; Shen, Han-Wei',2009,'','10.1109/PACIFICVIS.2009.4906844','','In this paper, we present a novel adaptive visualization technique where the constituting polygons dynamically change their geometry and other visual attributes depending on user interaction. These changes take place with the objective of conveying required level of detail to the user through each view. Our proposed technique is successfully applied to build a treemap-based but 3D visualization of hierarchical data, a widely used information structure. This new visualization exploits its adaptive nature to address issues like cluttered display, imperceptible hierarchy, lack of smooth zoom-in and out technique which are common in tree visualization. We also present an algorithm which utilizes the flexibility of our proposed technique to deal with occlusion, a problem inherent in any 3D information visualization. On one hand, our work establishes adaptive visualization as a means of displaying tree-structured data in 3D. On the other, it promotes the technique as a potential candidate for being employed to visualize other information structures also.','Devroye1995.png','2025-06-07 15:50:12','2025-06-07 15:51:52',1,'A_Self-adaptive_Treemap-based_Technique_for_Visual_Chaudhuri_Abon_8b25b287.bib'),
(56,'Point Placement by Phylogenetic Trees and its Application to Visual Analysis of Document Collections','Cuadros, Ana M.; Paulovich, Fernando V.; Minghim, Rosane; Telles, Guilherme P.',2007,'','10.1109/VAST.2007.4389002','','The task of building effective representations to visualize and explore collections with moderate to large number of documents is hard. It depends on the evaluation of some distance measure among texts and also on the representation of such relationships in bi- dimensional spaces. In this paper we introduce an alternative approach for building visual maps of documents based on their content similarity, through reconstruction of phylogenetic trees. The tree is capable of representing relationships that allows the user to quickly recover information detected by the similarity metric. For a variety of text collections of different natures we show that we can achieve improved exploration capability and more clear visualization of relationships amongst documents.','Carlson2006.png','2025-06-07 15:50:18','2025-06-07 15:51:19',1,'Point_Placement_by_Phylogenetic_Trees_and_its_Appl_Cuadros_Ana_M_09246838.bib'),
(58,'Variational Circular Treemaps for interactive visualization of hierarchical data','Zhao, Haisen; Lu, Lin',2015,'','10.1109/PACIFICVIS.2015.7156360','','Visualization of hierarchical data is of great importance in information visualization. We present variational circular treemaps with a novel layout algorithm by solving disk packing as a continuous optimization problem. Our variational circular treemaps achieve higher space utilization ratio compared with the traditional circular treemaps and support natural interactions as focus+context distortions and drill-down and roll-up operations for data navigation. Experimental results show the effectiveness of our method for visualization and interaction.','Churcher1999.png','2025-06-07 16:18:17','2025-06-07 17:01:25',1,'Variational_Circular_Treemaps_for_interactive_visu_Zhao_Haisen_520166de.bib'),
(59,'Visualizing the Structure of Large Trees','Aydin, Burcu; Pataki, Gabor; Wang, Haonan; Ladha, Alim; Bullitt, Elizabeth; Marron, J.S.',2011,'Electronic Journal of Statistics','','http://projecteuclid.org/euclid.ejs/1305034908','This study introduces a new method of visualizing complex tree structured objects. The usefulness of this method is illustrated in the context of detecting unexpected features in a data set of very large trees. The major contribution is a novel two-dimensional graphical representation of each tree, with a covariate coded by color. The motivating data set contains three dimensional representations of brain artery systems of 105 subjects. Due to inaccuracies inherent in the medical imaging techniques, issues with the reconstruction algo- rithms and inconsistencies introduced by manual adjustment, various discrepancies are present in the data. The proposed representation enables quick visual detection of the most common discrepancies. For our driving example, this tool led to the modification of 10\\% of the artery trees and deletion of 6.7\\%. The benefits of our cleaning method are demonstrated through a statistical hypothesis test on the effects of aging on vessel structure. The data cleaning resulted in improved significance levels.','Eppstein2009.png','2025-06-07 16:18:23','2025-06-07 17:01:09',1,'Visualizing_the_Structure_of_Large_Trees_Aydin_Burcu_29ef285d.bib'),
(60,'Graphics and Graphic Information Processing','Bertin, Jacques',1981,'','10.1515/9783110854688','','','Eichhorn2006.png','2025-06-07 16:18:28','2025-06-07 17:00:54',1,'Graphics_and_Graphic_Information_Processing_Bertin_Jacques_05c7642b.bib'),
(61,'Navigation Techniques for Zoomable Treemaps','Blanch, Renaud; Lecolinet, \\\'Eric',2006,'','','http://www.acm.org/uist/archive/adjunct/2006/pdf/demos/p49-blanch.pdf','This paper presents a new technique called zoomable treemaps that makes it possible to navigate in very large trees. It integrates several efficient interaction techniques that enable multi-scale and structure-aware navigation.','Andrews2002.png','2025-06-07 16:18:33','2025-06-07 17:00:33',1,'Navigation_Techniques_for_Zoomable_Treemaps_Blanch_Renaud_1bc428d0.bib'),
(62,'A Magic Treemap Cube for Visualizing Olympic Games Data','Chen, Xiaowu; Yang, Haolin; Ma, Yongtao; Zhou, Bin',2010,'The International Journal of Virtual Reality','','http://www.ijvr.org/issues/issue3-2010/paper2.pdf','Treemap, a common information visualization approach for dividing a display area into nested rectangles, has a good performance on visualizing hierarchical data. And it enables user to compare nodes in the same level and to learn certain relationship between adjacent levels. However, treemap layout is limited to visualize multi-dimensional hierarchical data in which the hierarchy is unfixed and complex, especially when the hierarchy is an arbitrary graph. Considering this problem, we present a novel extension called magic treemap cube, which improves the layout and has a good performance on visualizing unfixed (cross-level) and complex data, inverting hierarchy without reorganizing the structure, and enabling users to easily compare among treemaps. The magic treemap cube is a three-dimensional regular hexahedron whose six faces are covered by six different treemaps. Each dimension of the magic treemap cube is a hierarchy structure specified by users according to a hierarchical division of visualization information. With the treemap algorithm, tagcloud and mapping rules, the treemaps are automatically controlled by permutations of three dimensions of the cube. Users could observe the six correlative treemaps respectively by rotating the magic treemap cube in three dimensional Cartesian coordinate. And this magic treemap cube can be unfolded into a tiled treemap in 2D Cartesian coordinate for users-friendly comparison of each treemap. Meanwhile, a merging operation to the tiled treemap is proposed to not only compare two treemaps through the adjacency relations among faces but also provide more information. For demonstrating the above characteristics, an application (called OlympicVis) has been implemented to visualize the Beijing 2008 Olympic Games information, which involves multi-dimensional hierarchy and interconnected data. The OlympicVis can display Cube View, Schedule View, Medal View, Date Filter and Time Line.','Bocoup2011.png','2025-06-07 16:18:38','2025-06-07 16:54:49',1,'A_Magic_Treemap_Cube_for_Visualizing_Olympic_Games_Chen_Xiaowu_938fe325.bib'),
(63,'Extending Tree-Maps to Three Dimensions: A Comparative Study','Bladh, Thomas; Carr, David A.; Scholl, Jeremiah',2004,'','10.1007/978-3-540-27795-8_6','','This paper presents StepTree, an information visualization tool designed for depicting hierarchies, such as directory structures. StepTree is similar to the hierarchy-visualization tool, Treemap, in that it uses a rectangular, space-filling methodology, but differs from Treemap in that it employs three-dimensional space, which is used to more clearly convey the structural relationships of the hierarchy. The paper includes an empirical study comparing typical search and analysis tasks using StepTree and Treemap. The study shows that users perform significantly better on tasks related to interpreting structural relationships when using StepTree. In addition, users achieved the same performance with StepTree and Treemap when doing a range of other common interpretative and navigational tasks.','Hasan2002.png','2025-06-07 16:18:43','2025-06-07 16:57:34',1,'Extending_Tree-Maps_to_Three_Dimensions_A_Comparat_Bladh_Thomas_27954669.bib'),
(64,'Generalized {Pythagoras Trees} for Visualizing Hierarchies','Beck, Fabian; Burch, Michael; Munz, Tanja; Silvestro, Lorenzo Di; Weiskopf, Daniel',2014,'','10.5220/0004654500170028','','Pythagoras Trees are fractals that can be used to depict binary hierarchies. But this binary encoding is an obstacle for visualizing hierarchical data such as file systems or phylogenetic trees, which branch into n subhierarchies. Although any hierarchy can be modeled as a binary one by subsequently dividing n-ary branches into a sequence of n-1 binary branches, we follow a different strategy. In our approach extending Pythagoras Trees to arbitrarily branching trees, we only need a single visual element for an n-ary branch instead of spreading the binary branches along a strand. Each vertex in the hierarchy is visualized as a rectangle sized according to a metric. We analyze several visual parameters such as length, width, order, and color of the nodes against the use of different metrics. The usefulness of our technique is illustrated by two case studies visualizing directory structures and a large phylogenetic tree. We compare our approach with existing tree diagrams and discuss questions of geometry, perception, readability, and aesthetics.','Heard2009.png','2025-06-07 17:12:36','2025-06-08 09:04:00',1,'Generalized_Pythagoras_Trees_for_Visualizing_Hiera_Beck_Fabian_ad8e4c8a.bib'),
(65,'DensiTree 2: Seeing trees through the forest','Bouckaert, Remco R.; Heled, Joseph',2014,'bioRxiv.org e-print service','10.1101/012401','','Phylogenetic analysis like Bayesian MCMC or bootstrapping result in a collection of trees. Trees are discrete objects and it is generally difficult to get a mental grip on a distributions over trees. Visualisation tools like DensiTree can give good intuition on tree distributions. It works by drawing all trees in the set transparently thus highlighting areas where the tree in the set agrees. In this way, both uncertainty in clade heights and uncertainty in topology can be visualised. In our experience, a vanilla DensiTree can turn out to be misleading in that it shows too much uncertainty due to wrongly ordering taxa or due to unlucky placement of internal nodes. DensiTree is extended to allow visualisation of meta-data associated with branches such as population size and evolutionary rates. Furthermore, geographic locations of taxa can be shown on a map, making it easy to visually check there is some geographic pattern in a phylogeny. Taxa orderings have a large impact on the layout of the tree set, and advances have been made in finding better orderings resulting in significantly more informative visualisations. We also explored various methods for positioning internal nodes, which can improve the quality of the image. Together, these advances make it easier to comprehend distributions over trees.','Karstens2003.png','2025-06-07 17:12:41','2025-06-07 18:53:59',1,'DensiTree_2_Seeing_trees_through_the_forest_Bouckaert_Remco_R_1e5f5608.bib'),
(66,'Methods and devices for selecting items such as data files','Clifton-Bligh, Gervase',2010,'','','http://www.freepatentsonline.com/7764272.html','A method is described for allowing a user to select one of a plurality of items. The user employs a device having a display area, and a joystick or a contact sensitive area. The device displays a number of regions equal to the number of items, and defines a number of sections in the angular range of the joystick, or sections within the contact sensitive area, equal to the number of items, and arranged corresponding to the arrangement of the regions of the display area. The user selects one of said items by selecting the corresponding section.','Elzen2011.png','2025-06-07 17:12:47','2025-06-07 18:53:23',1,'Methods_and_devices_for_selecting_items_such_as_da_Clifton-Bligh_Gervase_a890a1b7.bib'),
(67,'Graphic Presentation','Brinton, Willard Cope',1939,'','','http://www.archive.org/details/graphicpresentat00brinrich','Graphic Presentation is largely a collection of interesting charts and pictures, mostly of a non-technical nature,covering a wide range of subject matter, with brief comment on methodology under each illustration. These charts and pictures are reproductions from numerous sources, including a few from his Graphic Methods. In addition to the chapters on types of charts and excerpts from Time Series Charts: A Manual of Design and Construction published by the American Society of Mechanical Engineers, there are some quasi-technical chapters on such things as the use of cameras and lantern slides, selection of paper, and methods of reproduction, printing, and binding. A chapter on tabulation is thrown in, apparently for good measure. Illustrations on alternate pairs of facing pages arc in color, and these pages contain also decorative chapter identification (bleed-outs) at the top and bottom. Printing was done by the photo offset process. The verbal language is Basic English. A minor feature of the book is a device whereby the reader may spin the pages rapidly until he reaches the desired chapter. On page 453 is given a detailed description of how the book was made up, including the names and addresses of the companies furnishing materials or services. This book departs from the earlier contribution in several respects. Text material is boiled down almost to the vanishing point, leaving the maximum number of charts to speak for themselves.','Dmitrieva2009.png','2025-06-07 17:12:53','2025-06-07 17:50:14',1,'Graphic_Presentation_Brinton_Willard_Cope_fd1a9c63.bib'),
(68,'{DocuBurst}: Visualizing Document Content using Language Structure','Collins, Christopher; Carpendale, Sheelagh; Penn, Gerald',2009,'Computer Graphics Forum','10.1111/j.1467-8659.2009.01439.x','','Textual data is at the forefront of information management problems today. One response has been the development of visualizations of text data. These visualizations, commonly based on simple attributes such as relative word frequency, have become increasingly popular tools. We extend this direction, presenting the first visualization of document content which combines word frequency with the human-created structure in lexical databases to create a visualization that also reflects semantic content. DocuBurst is a radial, space-filling layout of hyponymy (the IS-A relation), overlaid with occurrence counts of words in a document of interest to provide visual summaries at varying levels of granularity. Interactive document analysis is supported with geometric and semantic zoom, selectable focus on individual words, and linked access to source text.','EdChi1998.png','2025-06-07 17:13:00','2025-06-07 17:49:58',1,'DocuBurst_Visualizing_Document_Content_using_Langu_Collins_Christopher_0ffb1ab6.bib'),
(69,'Structural Analysis and Visualization of {C}++ Code Evolution using Syntax Trees','Chevalier, Fanny; Auber, David; Telea, Alexandru',2007,'','10.1145/1294948.1294971','','We present a method to detect and visualize evolution patterns in C++ source code. Our method consists of three steps. First, we extract an annotated syntax tree (AST) from each version of a given C++ source code. Next, we hash the extracted syntax nodes based on a metric combining structure and type information, and construct matches (correspondences) between similar-hash subtrees. Our technique detects code fragments which have not changed, or changed little, during the software evolution. By parameterizing the similarity metric, we can flexibly decide what is considered to be identical or not during the software evolution. Finally, we visualize the evolution of the code structure by emphasizing both changing and constant code patterns. We demonstrate our technique on a versioned code base containing a variety of changes ranging from simple to complex.','Cao2013.png','2025-06-07 17:13:12','2025-06-07 17:38:12',1,'Structural_Analysis_and_Visualization_of_C_Code_Ev_Chevalier_Fanny_b14685f1.bib'),
(70,'A note on optimal area algorithms for upward drawings of binary trees','Crescenzi, Pierluigi; Battista, Giuseppe Di; Piperno, Adolfo',1992,'Computational Geometry','10.1016/0925-7721(92)90021-J','','The goal of this paper is to investigate the area requirements for upward grid drawings of binary trees. First, we show that there is a family of binary trees with n vertices that require w(n*logn) area; this bound is tight to within a constant factor, i.e. any binary tree with n vertices can be drawn in O(n*logn) area. Then we present an algorithm for constructing an upward drawing of a complete binary tree with n vertices in O(n) area, and, finally, we extend this result to the drawings of Fibonacci trees.','Bocoup2011.png','2025-06-07 17:13:18','2025-06-07 17:37:42',1,'A_note_on_optimal_area_algorithms_for_upward_drawi_Crescenzi_Pierluigi_ccf455df.bib'),
(71,'Creating Visual Browsers for Large-Scale Online Auctions','Huang, Mao Lin; Nguyen, Quang Vinh; Lai, Wei',2007,'','10.1007/978-3-540-37017-8_27','','This chapter discusses the requirements raised for running online auctions as well as the technical issues on the design of graphical user interfaces and how we could use these graphical interfaces to help users navigate visualization technique called EncCon as well as the design of graphic attributes that can be used to present the domain specific attributes of the auction items and the relational structures among these items, and these graphic presentations will provide users with a clear map showing the possible paths to the target items. We will demonstrate the effectiveness of our techniques by illustrating an online auction prototype that simulates the ordinary auction activities with the assistance of visualization.','Brinton1939.png','2025-06-07 17:13:25','2025-06-07 17:37:31',1,'Creating_Visual_Browsers_for_Large-Scale_Online_Au_Huang_Mao_Lin_95769f92.bib'),
(72,'{Timeline Trees}: visualizing sequences of transactions in information hierarchies','Burch, Michael; Beck, Fabian; Diehl, Stephan',2008,'','10.1145/1385569.1385584','','In many applications transactions between the elements of an information hierarchy occur over time. For example, the product offers of a department store can be organized into product groups and subgroups to form an information hierarchy. A market basket consisting of the products bought by a customer forms a transaction. Market baskets of one or more customers can be ordered by time into a sequence of transactions. Each item in a transaction is associated with a measure, for example, the amount paid for a product. In this paper we present a novel method for visualizing sequences of these kinds of transactions in information hierarchies. It uses a tree layout to draw the hierarchy and a timeline to represent progression of transactions in the hierarchy. We have developed several interaction techniques that allow the users to explore the data. Smooth animations help them to track the transitions between views. The usefulness of the approach is illustrated by examples from several very different application domains.','Bladh2004.png','2025-06-08 09:38:47','2025-06-08 09:41:38',1,'Timeline_Trees_visualizing_sequences_of_transactio_Burch_Michael_afde9415.bib'),
(73,'Ordered and Unordered Treemap. Algorithms and Their Applications on Handheld Devices','Engdahl, Bj\\\"orn',2005,'','','http://w3.nada.kth.se/utbildning/grukth/exjobb/rapportlistor/2005/rapporter05/engdahl_bjorn_05033.pdf','This thesis describes a way to visualize hierarchical structures on PDAs using Treemaps. A new ordered layout algorithm for treemaps, called Split Layout, is presented. Traditionally, treemap algorithms have exhibited a trade off between good aspect ratio and ordered layout. The new Split Layout is compared to five published treemap algorithms. Properties such as avarage aspect ratio, stability, run time and readability are measured, and it is shown that the new Split Layout performs better than any known ordered layout. The average aspect ratio is about 23\\% better and the stability increased between 28\\% and 40\\%. A user study was performed to measure the quality of the ordering of the new algorithm. 30 users gave a total of 360 measured response times, and it was found that the median time to locate a specific rectangle in the treemap only took 0.14 seconds (5\\%) longer for the Split Layout than for the Pivot by Split Size algorithm. The technique was implemented on a PDA and used for visualizing threaded discussion forums. User studies confirm that the concept on using treemaps on PDAs looks promising. The contents of the forum was easily grasped, even though the number of articles exceeded one hundred.','Husken2007.png','2025-06-08 09:38:52','2025-06-08 09:41:19',1,'Ordered_and_Unordered_Treemap_Algorithms_and_Their_Engdahl_Bjorn_e6ac871c.bib'),
(74,'Dynamic Aggregation with Circular Visual Designs','Chuah, Mei C.',1998,'','10.1109/INFVIS.1998.729557','','One very effective method for managing large data sets is aggregation or binning. We consider two aggregation methods that are tightly coupled with interactive manipulation and the visual representation of the data. Through this integration we hope to provide effective support for the aggregation process, specifically by enabling: 1) automatic aggregation, 2) continuous change and control of the aggregation level, 3) spatially based aggregates, 4) context maintenance across different aggregate levels, and 5) feedback on the level of aggregation.','solarplot.png','2025-06-08 09:39:00','2025-06-08 13:04:00',1,'Dynamic_Aggregation_with_Circular_Visual_Designs_Chuah_Mei_C_39f82412.bib'),
(75,'Treemaps zoomables: techniques d\'interaction multi-\\\'echelles pour les treemaps','Blanch, Renaud; Lecolinet, Eric',2007,'','10.1145/1541436.1541462','','Some efficient visualizations (such as treemaps) have been proposed for trees, but the interaction they provide to explore and acces data is often poor, especially for very large trees. We have designed a consistent set of navigation techniques that makes it possible to use treemaps as zoomable interfaces. We introduce structure-aware navigation, the property of using the structure of the displayed information to guide navigation, property that our interaction techniques share.','Card2002.png','2025-06-08 09:39:54','2025-06-08 17:45:11',1,'Treemaps_zoomables_techniques_dinteraction_multi-e_Blanch_Renaud_99a294e6.bib'),
(76,'{Double Tree}: An Advanced {KWIC} Visualization for Expert Users','Culy, Chris; Lyding, Verena',2010,'','10.1109/IV.2010.24','','In this paper we present Double Tree, a new visualization of Key Word In Context (KWIC) displays targeted to support linguistic analysis. Inspired by Wattenberg\'s and Viegas\' Word Tree visualization, Double Tree extends the idea of representing KWIC results as trees. We address several issues with Word Trees with respect to the specific demands of linguists and discuss the design decisions and implementation details that we chose for Double Tree. In particular we present our approach for displaying a two-sided tree. We describe details of the layout, including how frequency and linguistic information is incorporated, and what user interaction is supported. We conclude with some consideration on possible next steps for Double Tree.','Chuanxi2011.png','2025-06-08 09:39:59','2025-06-08 09:40:40',1,'Double_Tree_An_Advanced_KWIC_Visualization_for_Exp_Culy_Chris_51e98113.bib'),
(77,'Visualizing {BFS} as a spiral','Eppstein, David',2009,'','','http://11011110.livejournal.com/171440.html','','BruggemannKlein1989.png','2025-06-08 09:40:06','2025-06-08 09:40:27',1,'Visualizing_BFS_as_a_spiral_Eppstein_David_b6fbfe6a.bib'),
(78,'The {DeepTree} Exhibit: Visualizing the {Tree of Life} to Facilitate Informal Learning','Block, Florian; Horn, Michael S.; Phillips, Brenda Caldwell; Diamond, Judy; Evans, E. Margaret; Shen, Chia',2012,'IEEE Transactions on Visualization and Computer Graphics','10.1109/TVCG.2012.272','','In this paper, we present the DeepTree exhibit, a multi-user, multi-touch interactive visualization of the Tree of Life. We developed DeepTree to facilitate collaborative learning of evolutionary concepts. We will describe an iterative process in which a team of computer scientists, learning scientists, biologists, and museum curators worked together throughout design, development, and evaluation. We present the importance of designing the interactions and the visualization hand-in-hand in order to facilitate active learning. The outcome of this process is a fractal-based tree layout that reduces visual complexity while being able to capture all life on earth; a custom rendering and navigation engine that prioritizes visual appeal and smooth fly-through; and a multi-user interface that encourages collaborative exploration while offering guided discovery. We present an evaluation showing that the large dataset encouraged free exploration, triggers emotional responses, and facilitates visitor engagement and informal learning.','1681765932_kartinki-pibig-info-p-trekhmernaya-grafika-kartinki-arti-vkontak-16.png','2025-06-08 10:11:26','2025-06-08 10:14:18',1,'The_DeepTree_Exhibit_Visualizing_the_Tree_of_Life__Block_Florian_a2b83933.bib'),
(79,'Using Orthographic Projection and Animation to Convey Treemap Structure','Benson, Jordan Riley; Sullvan, Lee; Ramarajan, Rajiv; Wimmer, Frank; Hankey, Paul',2010,'','','http://blogs.sas.com/peerrevue/uploads/OrthographicTreeMap-summary.pdf','We present an alternative treemap visualization method that maintains the space-filling and area comparison benefits of the standard treemap while improving the range of possible comparisons and the clarity of the hierarchy. Our visualization uses an orthographic stack representation and relies on interaction and animation to reveal the structure of the treemap to the user, but is still effective in a static environment once the user reaches a view that interests them.','Goertler2018.png','2025-06-08 14:32:08','2025-06-08 14:35:20',1,'Using_Orthographic_Projection_and_Animation_to_Con_Benson_Jordan_Riley_dceae301.bib'),
(80,'Enriching Indented Pixel Tree Plots with Node-Oriented Quantitative, Categorical, Relational, and Time-Series Data','Burch, Michael; Raschke, Michael; Greis, Miriam; Weiskopf, Daniel',2012,'','10.1007/978-3-642-31223-6_14','','Indented Pixel Tree Plots are useful for an overview of large and deep hierarchical data. As a major benefit, these plots scale to pixel or even subpixel resolution, still clearly visualizing the hierarchical structures and substructures in a redundant-free representation. Consequently, there is display space available that may be used to show additional information such as enlarged or filtered subregions, details-on-demand, or control panels. In this paper, we demonstrate how this compact indented diagram can be enriched with additional data associated with both leaf and inner nodes of the hierarchy. To this end, we support quantitative, categorical, relational, and time-series data. By such a combination, exploration and analysis of visual patterns and anomalies on different levels of hierarchical granularity are possible in a static diagram. Furthermore, interactive features such as expanding/collapsing of subhierarchies, horizontal/vertical distortions, zooming in/out, or details-on-demand are integrated to allow the user to inspect the data from different viewpoints. The usefulness of the enriched diagrams is illustrated by applying them to file system data where single software constructs are hierarchically organized. Here, we focus on quantitative, categorical, and relational data attached to the nodes of the hierarchy. In a second case study, we demonstrate how evolving water level data of rivers in Germany can be represented by our plots.','Schulz2011_4.png','2025-06-08 14:33:09','2025-06-08 14:34:54',1,'Enriching_Indented_Pixel_Tree_Plots_with_Node-Orie_Burch_Michael_102638bd.bib'),
(81,'Family tree visualization','Eichhorn, Elisabeth',2006,'','','http://www.elisabetheichhorn.de/_en/projekte/weiter/stammbaum/stammbaum.html','','Jia2008.png','2025-06-08 14:33:19','2025-06-08 14:34:37',1,'Family_tree_visualization_Eichhorn_Elisabeth_f14e14af.bib'),
(82,'{RELT} -- Visualizing Trees on Mobile Devices','Hao, Jie; Zhang, Kang; Huang, Mao Lin',2007,'','10.1007/978-3-540-76414-4_34','','The small screens on increasingly used mobile devices challenge the traditional visualization methods designed for desktops. This paper presents a method called \"Radial Edgeless Tree\" (RELT) for visualizing trees in a 2-dimensional space. It combines the existing connection tree drawing with the space-filling approach to achieve the efficient display of trees in a small geometrical area, such as the screen that are commonly used in mobile devices. We recursively calculate a set of non-overlapped polygonal nodes that are adjacent in the hierarchical manner. Thus, the display space is fully used for displaying nodes, while the hierarchical relationships among the nodes are presented by the adjacency (or boundary-sharing) of the nodes. It is different from the other traditional connection approaches that use a node-link diagram to present the parent-child relationships which waste the display space. The hierarchy spreads from north-west to south-east in a top-down manner which naturally follows the traditional way of human perception of hierarchies. We discuss the characteristics, advantages and limitations of this new technique and suggestions for future research.','Jusufi2012.png','2025-06-08 14:33:23','2025-06-08 14:34:17',1,'RELT_--_Visualizing_Trees_on_Mobile_Devices_Hao_Jie_4a29269c.bib'),
(83,'Wordle','Feinberg, Jonathan',2010,'','','http://static.mrfeinberg.com/bv_ch03.pdf','Visualization is the graphic presentation of data -- portrayals meant to reveal complex information at a glance. Think of the familiar map of the New York City subway system, or a diagram of the human brain. Successful visualizations are beautiful not only for their aesthetic design, but also for elegant layers of detail that efficiently generate insight and new understanding. This book examines the methods of two dozen visualization experts who approach their projects from a variety of perspectives -- as artists, designers, commentators, scientists, analysts, statisticians, and more. Together they demonstrate how visualization can help us make sense of the world. Contributors include: Nick Bilton, Michael E. Driscoll, Jonathan Feinberg, Danyel Fisher, Jessica Hagy, Gregor Hochmuth, Todd Holloway, Noah Iliinsky, Eddie Jabbour, Valdean Klump, Aaron Koblin, Robert Kosara, Valdis Krebs, JoAnn Kuchera-Morin et al., Andrew Odewahn, Adam Perer, Anders Persson, Maximilian Schich, Matthias Shapiro, Julie Steele, Moritz Stefaner, Jer Thorp, Fernanda Viegas, Martin Wattenberg, and Michael Young.','Burch2008.png','2025-06-08 14:33:30','2025-06-08 14:33:50',1,'Wordle_Feinberg_Jonathan_95619734.bib');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_tag` (
  `article_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  KEY `article_id` (`article_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `article_tag_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` VALUES
(56,25),
(55,17),
(54,26),
(53,27),
(52,26),
(63,21),
(62,27),
(61,23),
(61,26),
(60,18),
(59,28),
(58,23),
(71,23),
(70,26),
(69,25),
(68,18),
(67,17),
(66,24),
(65,26),
(64,18),
(64,25),
(64,26),
(60,26),
(77,22),
(76,25),
(75,21),
(75,27),
(74,17),
(73,25),
(72,26),
(78,18),
(83,26),
(82,22),
(81,27),
(80,23),
(79,17);
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES
(8,'Источник данных'),
(6,'Размерность'),
(7,'Тип методики визуализации');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES
(17,'2D',6),
(18,'3D',6),
(21,'Сетевой трафик',8),
(22,'Системные события',8),
(23,'Программный код',8),
(24,'Стандартные методы визуализации',7),
(25,'Пиктограммы',7),
(26,'На основе пиксельного представления',7),
(27,'Графы/деревья',7),
(28,'На основе геометрических преобразований',7);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'Admin','scrypt:32768:8:1$IWVEcrCnuqlNrYIa$e3cad50c21954452fa86a421e0cae293cf4ed8b58fecc64bce78b1289c94f90ff27b3aa5223f8830103a05e346f78fa5a5aa0227723642046fd83322f4d2b464',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08 22:56:52
