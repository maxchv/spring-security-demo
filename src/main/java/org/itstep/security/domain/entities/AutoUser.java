package org.itstep.security.domain.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Entity
@Table(name = "AUTO_USER")
@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class AutoUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long autoUserId;

    @Column(name = "FIRST_NAME")
    @NonNull
    private String firstName;

    @Column(name = "LAST_NAME")
    @NonNull
    private String lastName;

    @Column(name = "USERNAME")
    @NonNull
    private String username;

    @Column(name = "PASSWORD")
    @NonNull
    private String password;

    @Column(name = "ROLE")
    @NonNull
    private String role;

    @Column(name = "EMAIL")
    @NonNull
    private String email;

    @JsonIgnore
    @OneToMany(mappedBy = "user", cascade = { CascadeType.MERGE, CascadeType.REFRESH })
    @NonNull
    private List<Appointment> appointments = new ArrayList<Appointment>();

}
