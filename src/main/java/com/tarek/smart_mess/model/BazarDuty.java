package com.tarek.smart_mess.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Locale;

@Entity
@Table(name = "bazar_duty")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BazarDuty {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id",nullable = false)
    private Member member;

    @Column(name = "start_date",nullable = false)
    private LocalDate startAt;

    @Column(name = "end_date",nullable = false)
    private LocalDate endAt;
}
