import React, { useEffect } from 'react';
import Layout from '@theme-original/Layout';
import Head from '@docusaurus/Head';

export default function CustomLayout(props) {
  useEffect(() => {

    const script = document.createElement('script');
    script.innerHTML = `
window.yaContextCb.push(() => {
    Ya.Context.AdvManager.render({
        "blockId": "R-A-12294791-3",
        "type": "floorAd",
        "platform": "touch"
    })
})
    `;
    document.body.appendChild(script);

    // Удаляем элементы при размонтировании компонента
    return () => {
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