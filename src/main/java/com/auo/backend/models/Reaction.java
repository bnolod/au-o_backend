package com.auo.backend.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "app_reactions")
public class Reaction {
    @Id
    private Long reaction_id;
    private String reaction_name;

    public Reaction() {
    }

    public Reaction(String reaction_name) {
        this.reaction_name = reaction_name;
    }

    public Reaction(Long reaction_id, String reaction_name) {
        this.reaction_id = reaction_id;
        this.reaction_name = reaction_name;
    }
}
