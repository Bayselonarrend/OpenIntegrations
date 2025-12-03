import React from 'react';
import styles from './styles.module.css';

export default function Footer() {
  const currentYear = new Date().getFullYear();

  return (
    <footer className={styles.footer}>
      <div className={styles.container}>
        <div className={styles.copyright}>
          © {currentYear} OpenIntegrations. All rights reserved.
        </div>
        <div className={styles.disclaimer}>
          All trademarks, logos, and brand names are the property of their respective owners. 
          Use of these names, trademarks, and brands does not imply endorsement.
        </div>
      </div>
    </footer>
  );
}
