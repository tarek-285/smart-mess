package com.tarek.smart_mess.model;

import com.tarek.smart_mess.enums.BazarCategory;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "bazar_items")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BazarItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bazar_duty_id",nullable = false)
    private BazarDuty bazarDuty;

    @Column(name = "item_name",nullable = false)
    private String itemName;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private BazarCategory category;

    @Column(nullable = false,precision = 10,scale = 2)
    private BigDecimal price;

    @Column(name = "purchased_at",nullable = false,updatable = false)
    private LocalDateTime purchasedAt=LocalDateTime.now();
}

