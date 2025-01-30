package com.auo.backend.models;



import com.auo.backend.enums.UserRole;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "app_users")
public class User implements UserDetails {


    @Id
    @GeneratedValue
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    private String password;

    @NotNull
    private String nickname;

    private UserRole role;

    @Column(unique = true, nullable = false)
    private String email;

    private boolean isPublic;

    private String profileImg;

    private String bio;

    @NotNull
    private LocalDate dateOfBirth;

    @NotNull
    private LocalDate dateOfSignup;

    @OneToMany()
//    @JoinTable(name = "app_user_posts",
//    joinColumns = @JoinColumn (name = "post_id"))
    private List<Post> posts;

    @OneToMany(mappedBy = "user")
    private List<Comment> comments;

    @OneToMany(mappedBy = "user")
    private List<GroupMember> groupMembers;


    @OneToMany(mappedBy = "user")
    private List<CommentReply> replies;

    @PrePersist
    protected void onCreate() {
        if (this.dateOfSignup == null) {
            this.dateOfSignup = LocalDate.now();
        }
    }

    @OneToMany(mappedBy = "user")
    private List<Reaction> reactions;


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of();
    }

    @Override
    public boolean isAccountNonExpired() {
        return UserDetails.super.isAccountNonExpired();
    }

    @Override
    public boolean isAccountNonLocked() {
        return UserDetails.super.isAccountNonLocked();
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return UserDetails.super.isCredentialsNonExpired();
    }

    @Override
    public boolean isEnabled() {
        return UserDetails.super.isEnabled();
    }
}
