//package com.iii.sierra.api.bdd.hibernate.tables;
//
//import org.hibernate.annotations.GenericGenerator;
//
//import javax.persistence.*;
//import java.io.Serializable;
//import java.math.BigDecimal;
//
///**
// * Created by ssatelle on 11/11/14.
// * for the project api-bdd-tests
// *
// * Model class for the table patron_record
// */
//@Entity
//@Table(name = "patron_record")
//public class patronRecord implements Serializable {
//        private static final long serialVersionUID = 1L;
//        private Integer id;
//        private BigDecimal recordId;
//        private String name;
//        private BigDecimal price;
//
//        @Id
//        @GenericGenerator(name="generator", strategy="increment")
//        @GeneratedValue(generator="generator")
//        @Column(name = "id", unique = true, nullable = false)
//        public Integer getId() {
//            return id;
//        }
//        public void setId(Integer id) {
//            this.id = id;
//        }
//
//        @Column(name = "record_id", unique = true, nullable = false, length = 10)
//        public BigDecimal getRecordId() {
//            return recordId;
//        }
//        public void setRecordId(BigDecimal recordId) {
//            this.recordId = recordId;
//        }
//
//        @Column(name = "name", unique = true, nullable = false, length = 10)
//        public String getName() {
//            return name;
//        }
//        public void setName(String name) {
//            this.name = name;
//        }
//
//        @Column(name = "price", unique = true, nullable = false, length = 10)
//        public BigDecimal getPrice() {
//            return price;
//        }
//        public void setPrice(BigDecimal price) {
//            this.price = price;
//        }
//
//        @Override
//        public String toString() {
//            return "Product [id=" + id + ", code=" + code + ", name="
//                    + name + ", price=" + price + "]";
//        }
//}
