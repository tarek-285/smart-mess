package com.tarek.smart_mess.model;

import com.tarek.smart_mess.enums.MealType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name="meal_sessions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MealSession {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name= "mess_id",nullable = false)
    private Mess mess;

    @Enumerated(EnumType.STRING)
    @Column(name="meal_type", nullable = false)
    private MealType mealtype;

    @Column(name = "meal_date",nullable = false)
    private LocalDate mealDate;

    @Column(name="cooked_start_time")
    private LocalTime cookedStartTime;

    @Column(name= "created_at" ,nullable = false)
    private LocalDateTime createdAt =LocalDateTime.now();


}
