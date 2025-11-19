import React, { useState, useMemo } from 'react';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import Heading from '@theme/Heading';
import styles from './courses.module.css';
import CustomFooter from '@site/src/components/CustomFooter';
import coursesData from '../../data/courses.json';

const CoursesPage = () => {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [showSubscriptionModal, setShowSubscriptionModal] = useState(false);
  const [showPurchaseModal, setShowPurchaseModal] = useState(false);
  const [selectedCourse, setSelectedCourse] = useState(null);
  
  const { courses, categories, subscriptionInfo } = coursesData;

  const filteredCourses = useMemo(() => {
    return courses.filter(course => {
      const matchesSearch = course.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
                           course.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
                           course.tags.some(tag => tag.toLowerCase().includes(searchQuery.toLowerCase()));
      
      const matchesCategory = selectedCategory === 'all' || course.category === selectedCategory;
      
      return matchesSearch && matchesCategory;
    });
  }, [searchQuery, selectedCategory]);

  const handlePurchaseClick = (course) => {
    setSelectedCourse(course);
    setShowPurchaseModal(true);
  };

  const SubscriptionModal = () => (
    <div className={`${styles.modalOverlay} ${showSubscriptionModal ? styles.modalOverlayVisible : ''}`}
         onClick={() => setShowSubscriptionModal(false)}>
      <div className={styles.modalFeaturesContent} onClick={(e) => e.stopPropagation()}>
        <div className={styles.modalHeader}>
          <h1>{subscriptionInfo.title}</h1>
        </div>
        
        <div className={styles.modalBody}>
          <p className={styles.subscriptionDescription}>{subscriptionInfo.description}</p>
          
          <div className={styles.featuresGrid}>
            {subscriptionInfo.features.map((feature, index) => (
              <div key={index} className={styles.featureCard}>
                <svg className={styles.featureIcon} xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={0.8} stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" d={feature.icon} />
                </svg>

                <h3 className={styles.featureTitle}>{feature.title}</h3>
                <p className={styles.featureDescription}>{feature.description}</p>
              </div>
            ))}
          </div>
        </div>
        
        <div className={styles.modalFooter}>
          <button 
            className={styles.secondaryButton}
            onClick={() => setShowSubscriptionModal(false)}
          >
            Закрыть
          </button>
          <Link
            href={subscriptionInfo.boostyUrl}
            className={styles.primaryButton}
            target="_blank"
          >
            Перейти на Boosty
          </Link>
        </div>
      </div>
    </div>
  );

  const PurchaseModal = () => {
    if (!selectedCourse) return null;

    return (
      <div className={`${styles.modalOverlay} ${showPurchaseModal ? styles.modalOverlayVisible : ''}`}
           onClick={() => setShowPurchaseModal(false)}>
        <div className={styles.modalContent} onClick={(e) => e.stopPropagation()}>
          <div className={styles.courseBannerModal}>
            <img 
              src={selectedCourse.banner} 
              alt={selectedCourse.title}
              onError={(e) => {
                e.target.src = '/img/Courses/default.png';
              }}
            />
          </div>
          
          <div className={styles.modalHeader}>
            <h2>{selectedCourse.title}</h2>
          </div>
          
          <div className={styles.modalBody}>
            <div className={styles.tags}>
              {selectedCourse.tags.map(tag => (
                <span key={tag} className={styles.tag}>#{tag}</span>
              ))}
            </div>
            
            <div className={styles.courseDescriptionModal}>
              <h3>О материале</h3>
              <p>{selectedCourse.descriptionExtended}</p>
              
              <div className={styles.courseDetails}>
                <div className={styles.detailItem}>
                  <strong>Формат:</strong> {selectedCourse.format}
                </div>
                <div className={styles.detailItem}>
                  <strong>Доступ:</strong> Бессрочный
                </div>
              </div>
            </div>

            <div className={styles.courseProgram}>
              <h3>Что вы получите:</h3>
              <ul className={styles.programList}>
                <li>✓ Полный доступ к текстовому материалу</li>
                <li>✓ Обновления контента бесплатно</li>
              </ul>
            </div>

            <div className={styles.accessInfo}>
              <h4>Как работает доступ:</h4>
              <p>
                Доступ приобретается путем покупки поста на сервисе Boosty. Внутри этого поста находится ссылка для перехода к купленным материалам. Подобные ссылки обновляются в начале каждого месяца. Если ссылка была обновлена (перестала работать) или вы утратили свою старую ссылку еще до обновления, то всегда можете получить ее повторно в том же посте, что приобрели ранее.
              </p>
              <br/>
              <p>Если вы столкнулись с проблемой, то можете связаться со мной одним из следующих способов:</p>
              <ul>
                <li>
                  <b>Email:</b> support@openintegrations.dev
                </li>
                <li>
                  <b>Telegram:</b> @bayselonarrend
                </li>
              </ul>
            </div>
          </div>
          
          <div className={styles.modalFooter}>
            <button 
              className={styles.secondaryButton}
              onClick={() => setShowPurchaseModal(false)}
            >
              Закрыть
            </button>
            <Link
              href={selectedCourse.buyUrl}
              className={styles.primaryButton}
              target="_blank"
              onClick={() => setShowPurchaseModal(false)}
            >
              Купить за {selectedCourse.price} ₽
            </Link>
          </div>
        </div>
      </div>
    );
  };

  const CourseCard = ({ course }) => (
    <div className={styles.courseCard}>
      <div className={styles.courseBanner}>
        <img 
          src={course.banner} 
          alt={course.title}
          onError={(e) => {
            e.target.src = '/img/Courses/default.png';
          }}
        />
      </div>
      
      <div className={styles.courseContent}>
        <div className={styles.courseHeader}>
          <h3 className={styles.courseTitle}>{course.title}</h3>
          <div className={styles.tags}>
            {course.tags.map(tag => (
              <span key={tag} className={styles.tag}>#{tag}</span>
            ))}
          </div>
        </div>
        
        <p className={styles.courseDescription}>{course.description}</p>
        
        <div className={styles.courseActions}>
          {course.type === 'free' ? (
            <Link
              href={course.externalUrl}
              className={styles.freeButton}
              target="_blank"
            >
              <svg className={styles.buttonIcon} viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
              </svg>
              Бесплатно
            </Link>
          ) : (
            <>
              <button 
                className={styles.buyButton}
                onClick={() => handlePurchaseClick(course)}
              >
                {course.price} ₽
              </button>
              <button 
                className={styles.subscriptionButton}
                onClick={() => setShowSubscriptionModal(true)}
              >
                <svg className={styles.buttonIcon} viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
                </svg>
                По подписке
              </button>
            </>
          )}
        </div>
      </div>
    </div>
  );

  return (
    <Layout 
      title="Курсы" 
      description="Курсы и материалы"
      wrapperClassName={styles.layoutWrapper}
    >
      <div className={styles.pageContainer}>
        <main className={`container margin-vert--lg ${styles.mainContent}`}>
          <div className={styles.coursesHeader}>
            <svg className={styles.coursesIcon} viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
            </svg>
            <div>
              <Heading as="h1" className={styles.coursesTitle}>
                Обучающие курсы и материалы
              </Heading>
              <p className={styles.coursesSubtitle}>
                Углубленное изучение аспектов и практик разработки с использованием Открытого пакета интеграций
              </p>
            </div>
          </div>

          <hr />

          <div className={styles.filtersSection}>
            <div className={styles.searchBox}>
              <svg className={styles.searchIcon} viewBox="0 0 24 24" fill="none" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
              <input
                type="text"
                placeholder="Поиск по материалам..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className={styles.searchInput}
              />
            </div>
            
            <div className={styles.categories}>
              {categories.map(category => (
                <button
                  key={category.id}
                  className={`${styles.categoryButton} ${
                    selectedCategory === category.id ? styles.categoryButtonActive : ''
                  }`}
                  onClick={() => setSelectedCategory(category.id)}
                >
                  {category.name}
                </button>
              ))}
            </div>
          </div>

          <div className={styles.coursesGrid}>
            {filteredCourses.map(course => (
              <CourseCard key={course.id} course={course} />
            ))}
          </div>

          {filteredCourses.length === 0 && (
            <div className={styles.noResults}>
              <p>Материалы по вашему запросу не найдены</p>
            </div>
          )}

          <SubscriptionModal />
          <PurchaseModal />
        </main>
        
        <CustomFooter />
      </div>
    </Layout>
  );
};

export default CoursesPage;