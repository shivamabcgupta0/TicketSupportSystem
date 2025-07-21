package model1;

public class Ticket {
    private int ticketId;
    private int userId;
    private String title;
    private String description;
    private String priority;

    // Constructors, getters, and setters

    public Ticket(int ticketId, int userId, String title, String description, String priority) {
        this.ticketId = ticketId;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.priority = priority;
    }

    // Getters and setters for other fields

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }
}