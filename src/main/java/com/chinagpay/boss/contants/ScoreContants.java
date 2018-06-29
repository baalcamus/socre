package com.chinagpay.boss.contants;

public class ScoreContants {

    /**
     * 评审状态
     */
    public enum ReviewStatuesEnum {
        REVIEW_INIT("REVIEW_INIT", "待评审"),
        REVIEW_SUCESS("REVIEW_SUCESS", "已评审");
        private String code;
        private String des;

        private ReviewStatuesEnum(String code, String des) {
            this.code = code;
            this.des = des;
        }

        /**
         * 获得编码
         *
         * @return
         */
        public String getCode() {
            return code;
        }

        /**
         * 描述
         *
         * @return
         */
        public String getDes() {
            return des;
        }
    }

        /**
         * 评审类型
         */
        public enum ReviewTypeEnum {
            TECHNOLOGY("TECHNOLOGY", "技术类"),
            FINANCE("FINANCE", "财务类");
            private String code;
            private String des;

            private ReviewTypeEnum(String code, String des) {
                this.code = code;
                this.des = des;
            }
            /**
             * 获得编码
             *
             * @return
             */
            public String getCode() {
                return code;
            }

            /**
             * 描述
             *
             * @return
             */
            public String getDes() {
                return des;
            }
        }
    }