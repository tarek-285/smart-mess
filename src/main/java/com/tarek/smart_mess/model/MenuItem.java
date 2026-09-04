package com.tarek.smart_mess.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="menu_items")
@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class MenuItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="meal_session_id",nullable = false)
    private MealSession mealSession;

    @Column(name = "item_name",nullable = false)
    private String itemName;


}
