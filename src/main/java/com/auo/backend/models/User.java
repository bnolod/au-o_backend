package com.auo.backend.models;



import com.auo.backend.enums.UserRole;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString(exclude = {"posts","comments","replies","groups","reactions","following","favoritePosts"})
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

    @JsonManagedReference("user-posts")
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<Post> posts;

    @JsonManagedReference("user-comments")
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<Comment> comments;

    @JsonManagedReference("user-groups")
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<GroupMember> groups;

    @JsonManagedReference("user-replies")
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<CommentReply> replies;

    @JsonManagedReference("user-reactions")
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<Reaction> reactions;

//    @OneToMany(mappedBy = "sender", fetch = )
//    private List<PrivateMessage> sentMessages;
//
//    @OneToMany(mappedBy = "recipient")
//    private List<PrivateMessage> receivedMessages;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<FavoritePost> favoritePosts;

    @ManyToMany
    @JoinTable(
            name = "user_followers",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "following_id")
    )
    private List<User> following;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Vehicle> vehicles;


    @NotNull
    private boolean isDeleted;

    @PrePersist
    protected void onCreate() {
        this.dateOfSignup = LocalDate.now();
        this.following = new ArrayList<>();
        this.comments = new ArrayList<>();
        this.groups = new ArrayList<>();
        this.reactions = new ArrayList<>();
        this.posts = new ArrayList<>();
        this.replies = new ArrayList<>();
        this.isDeleted = false;
    }

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
