package com.visualpathit.account.service;

import com.visualpathit.account.model.Task;
import com.visualpathit.account.repository.TaskRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    private final TaskRepository repo;

    public TaskServiceImpl(TaskRepository repo) {
        this.repo = repo;
    }

    @Override
    public List<Task> findAll() {
        return repo.findAll();
    }

    @Override
    public Task findById(Long id) {
        return repo.findById(id).orElse(null);
    }

    @Override
    public Task save(Task task) {
        return repo.save(task);
    }

    @Override
    public void deleteById(Long id) {
        repo.deleteById(id);
    }
}
