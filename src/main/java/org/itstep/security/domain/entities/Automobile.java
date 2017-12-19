package org.itstep.security.domain.entities;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class Automobile {

    @Column(name = "MAKE")
    @NonNull
    private String make;

    @Column(name = "MODEL")
    @NonNull
    private String model;

    @Column(name = "YEAR")
    @NonNull
    private Short year;
}
