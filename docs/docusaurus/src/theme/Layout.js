import React, { useEffect } from 'react';
import Layout from '@theme-original/Layout';
import Head from '@docusaurus/Head';

export default function CustomLayout(props) {
  useEffect(() => {
    // Создаем обертку для блока Яндекса под правым меню
    const wrapperRightMenu = document.createElement('div');
    wrapperRightMenu.style.width = '350px'; // Устанавливаем высоту обертки
    wrapperRightMenu.style.marginTop = '20px'; // Добавляем отступ сверху

    // Создаем <div> для блока Яндекса под правым меню
    const adDivRightMenu = document.createElement('div');
    adDivRightMenu.id = 'yandex_rtb_R-A-12294791-2';
    adDivRightMenu.style.width = '100%';

    // Добавляем рекламный блок в обертку
    wrapperRightMenu.appendChild(adDivRightMenu);

    // Находим правое меню и вставляем обертку под ним
    const rightMenu = document.querySelector('.theme-doc-toc-desktop');
    if (rightMenu) {
      rightMenu.style.width = '350px'; // Задайте желаемую ширину
      rightMenu.parentNode.appendChild(wrapperRightMenu);
    }

    // Создаем обертку для блока Яндекса над подвалом
    const wrapperAboveFooter = document.createElement('div');
    wrapperAboveFooter.style.height = '200px'; // Устанавливаем высоту обертки

    // Создаем <div> для блока Яндекса над подвалом
    const adDivAboveFooter = document.createElement('div');
    adDivAboveFooter.id = 'yandex_rtb_R-A-12294791-1';

    // Добавляем рекламный блок в обертку
    wrapperAboveFooter.appendChild(adDivAboveFooter);

    // Находим элемент подвала и вставляем обертку перед ним
    const footer = document.querySelector('footer');
    if (footer) {
      footer.parentNode.insertBefore(wrapperAboveFooter, footer);
    } else {
      // Если подвал не найден, добавляем в конец body как резервный вариант
      document.body.appendChild(wrapperAboveFooter);
    }

    // Добавляем скрипт для отображения рекламы для каждого блока
    const script = document.createElement('script');
    script.innerHTML = `
      window.yaContextCb.push(() => {
        Ya.Context.AdvManager.render({
          blockId: "R-A-12294791-2",
          renderTo: "yandex_rtb_R-A-12294791-2",
          type: "feed"
        });
        Ya.Context.AdvManager.render({
          blockId: "R-A-12294791-1",
          renderTo: "yandex_rtb_R-A-12294791-1",
          type: "feed"
        });
      });
    `;
    document.body.appendChild(script);

    // Удаляем элементы при размонтировании компонента
    return () => {
      wrapperRightMenu.remove();
      wrapperAboveFooter.remove();
      script.remove();
    };
  }, []);

  return (
    <>
      <Head>
        <script>
          window.yaContextCb = window.yaContextCb || [];
        </script>
        <script src="https://yandex.ru/ads/system/context.js" async></script>
      </Head>
      <Layout {...props} />
    </>
  );
}