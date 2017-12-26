package org.itstep.security.domain.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.ElementCollection;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.itstep.security.domain.entities.util.LocalDateConverter;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "APPOINTMENT")
@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class Appointment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "APPOINTMENT_ID")
    private Long appointmentId;

    @ManyToOne(fetch = FetchType.EAGER, cascade = { CascadeType.MERGE, CascadeType.REFRESH })
    @JoinColumn(name = "USER_ID")
    @NonNull
    private AutoUser user;

    @Embedded
    @NonNull
    private Automobile automobile;

    @Column(name = "APPOINTMENT_DT")
    @Convert(converter = LocalDateConverter.class)
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @NonNull
    private LocalDate appointmentDt;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "SERVICES", joinColumns = {@JoinColumn(name = "APPOINTMENT_ID")})
    @Column(name = "NAME")
    @NonNull
    private List<String> services = new ArrayList<String>();

    @Column(name = "STATUS")
    @NonNull
    private String status;
}
