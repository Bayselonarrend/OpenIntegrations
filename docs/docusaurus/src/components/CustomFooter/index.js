// components/CustomFooter.js
import React from 'react';
import styles from './styles.module.css';

const CustomFooter = () => {
    return (
        <footer className={styles.footer}>
            <div className={styles.footerContent}>
                <div className={styles.footerMain}>
                    <div className={styles.copyright}>
                        © 2025 OpenIntegrations
                    </div>
                    <div className={styles.links}>
                        <a href="/legal/offer" className={styles.link}>
                            Публичная оферта
                        </a>
                        <span className={styles.separator}>|</span>
                        <a href="/legal/privacy" className={styles.link}>
                            Политика конфиденциальности
                        </a>
                    </div>
                </div>

                <div className={styles.legalInfo}>
                    <p>
                        Вся деятельность осуществляется физическим лицом Титовцом Антоном Сергеевичем,
                        зарегистрированным в качестве плательщика налога на профессиональный доход (НПД)
                        в Инспекции МНС по Октябрьскому району г. Минска, УНП AE6868685.
                        Расчеты с физическими лицами производятся через сервис Boosty,
                        выступающий в роли агента по сбору платежей.
                    </p>
                </div>
            </div>
        </footer>
    );
};

export default CustomFooter;