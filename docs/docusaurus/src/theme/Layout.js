import React, { useEffect } from 'react';
import Layout from '@theme-original/Layout';
import Head from '@docusaurus/Head';
import { useLocation } from '@docusaurus/router';

export default function CustomLayout(props) {
  const location = useLocation();

  useEffect(() => {
    // Проверяем, находимся ли мы на странице документации
    if (!location.pathname.startsWith('/docs/')) {
      return; // Если нет, не добавляем блоки
    }

    // Удаляем скрипт Яндекс.Директа, если он уже был добавлен
    const existingScript = document.querySelector('script[src="https://yandex.ru/ads/system/context.js"]');
    if (existingScript) {
      existingScript.remove();
    }

    // Удаляем все контейнеры рекламы
    const existingAdContainers = document.querySelectorAll('[id^="yandex_rtb_R-A-12294791"]');
    existingAdContainers.forEach((container) => container.remove());

    // Создаем контейнер для второго рекламного блока
    const adContainer = document.createElement('div');
    adContainer.id = 'yandex_rtb_R-A-12294791-5';
    adContainer.style.marginTop = '20px'; // Добавим отступ для красоты

    // Находим элемент кнопок "Previous" и "Next" и вставляем перед ним
    const paginationElement = document.querySelector('.pagination-nav');
    if (paginationElement) {
      paginationElement.parentNode.insertBefore(adContainer, paginationElement);
    } else {
      // Если кнопок нет, добавляем контейнер в конец body
      document.body.appendChild(adContainer);
    }

    // Создаем и добавляем скрипт Яндекс.Директа
    const yandexScript = document.createElement('script');
    yandexScript.src = 'https://yandex.ru/ads/system/context.js';
    yandexScript.async = true;
    document.head.appendChild(yandexScript);

    // Запускаем рендеринг рекламных блоков, как только скрипт загрузится
    yandexScript.onload = () => {
      window.yaContextCb.push(() => {

        Ya.Context.AdvManager.render({
          blockId: 'R-A-12294791-5',
          renderTo: 'yandex_rtb_R-A-12294791-5'
        });
      });
    };

    // Удаляем элементы при размонтировании компонента
    return () => {
      yandexScript.remove();
      adContainer.remove();
    };
  }, [location.pathname]); // Перезапуск эффекта при изменении пути

  return (
    <>
      <Head>
        <script>
          window.yaContextCb = window.yaContextCb || [];
        </script>
      </Head>
      <Layout {...props} />
    </>
  );
}
