package com.csd430.model;

import java.io.Serializable;

/**
 * ============================================================================
 * name:			 Jordan Wrobel
 * date:			 11/13/2026
 * assignment:   Module 4.2
 * Class Name:   InceptionRecord
 * Description:  JavaBean encapsulating domain entity data for the movie Inception.
 * Standards:    Implementing java.io.Serializable, containing a public no-argument
 *               constructor, private fields, and standard public accessors/mutators.
 * Minimum Fields: 5 properties (category, name, role, dreamDepth, description).
 * Works Cited:  "can you help me create a javabean to hold some data" prompt. Gemini, 
 * 				 Google, 13 Nov. 2026, https://gemini.google.com/app.
 * ============================================================================
 */
public class InceptionRecord implements Serializable {

    // Unique serialization identifier for Serializable compliance
    private static final long serialVersionUID = 1L;

    // --- 5 Core Properties ---
    private String category;      // Field 1: Topical grouping (Cast, Totem, Tech, Rule)
    private String name;          // Field 2: Character, object, or concept name
    private String role;          // Field 3: Specific function or job role
    private int dreamDepth;       // Field 4: Associated subconscious dream level (0-4)
    private String description;   // Field 5: Comprehensive narrative summary

    /**
     * Mandatory public no-argument constructor for JavaBean specification.
     */
    public InceptionRecord() {
    }

    /**
     * Parameterized convenience constructor for clean data instantiation.
     */
    public InceptionRecord(String category, String name, String role, int dreamDepth, String description) {
        this.category = category;
        this.name = name;
        this.role = role;
        this.dreamDepth = dreamDepth;
        this.description = description;
    }

    // --- Public Getters and Setters ---

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getDreamDepth() {
        return dreamDepth;
    }

    public void setDreamDepth(int dreamDepth) {
        this.dreamDepth = dreamDepth;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}