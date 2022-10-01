package entity;

public class University {


    private Integer id;
    private String name;

    public University() {
    }

    public University(String name){
        this.name= name;
    }
    public University(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "entity.University{" +
                "id=" + id +
                '}';
    }
}
