package com.tarek.smart_mess.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "meal_orders")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MealOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "meal_session_id",nullable = false)
    private MealSession mealSession;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id",nullable = false)
    private Member member;

    @Column(nullable = false)
    private Integer quantity ;

    @Column(name="ordered_at",nullable = false,updatable = false)
    private LocalDateTime orderedAt=LocalDateTime.now();

}
