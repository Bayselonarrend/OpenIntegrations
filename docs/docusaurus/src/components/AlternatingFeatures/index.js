import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';
import Link from '@docusaurus/Link'; // Импортируем компонент Link из Docusaurus

const FeatureItem = ({ imageUrl, title, description }) => {
  return (
    <div className={clsx(styles.featureItem,)}>
      <div className={styles.featureImageWrapper}>
        <img src={imageUrl} alt={title} className={styles.featureImg} />
      </div>
      <div className={styles.featureContent}>
        <h3 className={styles.featureTitle}>{title}</h3>
        <div className={styles.featureDesc}>
          {typeof description === 'string' ? <p>{description}</p> : description}
        </div>
      </div>
    </div>
  );
};

const AlternatingFeatures = () => {
  const features = [
    {
      title: "Сотни методов для десятков сервисов",
      description: (
        <p>
        ОПИ состоит из большого набора разнообразных методов для множества известных API и технологий, будь то облачные Telegram, Bitrix24 и Google Drive, или же локальные S3, MySQL и PostgreSQL. Ознакомится с полным списком доступных сервисов можно на  
        <Link to="/docs/Instructions/Start" > вводной странице документации</Link>
        </p>
    ),
      imageUrl: "/img/f1.png"
    },
    {
      title: "Три платформы - одно решение",
      description:(
        <p>
         Открытый пакет интеграций прдоставляет единый набор функций сразу в трех вариантах: как расширение для 1С:Предприятие 8, как пакет для OneScript и как полноценное приложение для командной строки. Это позволяет удобно использовать его методы для решения широкого спектра задач, выбирая форму поствки в зависимости от конкретного сценария работы. Заранее собранные файлы для каждого из этих вариантов всегда можно найти в 
         <Link to="https://github.com/Bayselonarrend/OpenIntegrations/releases"> релизах ОПИ на GitHub </Link>
         - остается только скачать и запустить!
         </p>
         ),
      imageUrl: "/img/f2.png"
    },
    {
      title: "Свобода открытого кода",
      description: "Проект имеет открытый исходный коди и распространяется под лицензией MIT. Это означает, что вы можете использовать его в любых своих проектах, даже если они коммерческие и имеют закрытые исходники. Вся кодовая база проекта доступна публично в репозитории на GitHub и доступна для использования, а также полного или частичного изменения. Единственное условие - сохранение текста лицензии, который находится в каждом из файлов с кодом",
      imageUrl: "/img/f3.png"
    },

  ];

  return (
    <section className={styles.features}>
      <div className="container">
        {features.map((feature, idx) => (
          <FeatureItem
            key={idx}
            {...feature}
            isReversed={idx % 2 !== 0} // Чередуем порядок
          />
        ))}
      </div>
    </section>
  );
};

export default AlternatingFeatures;