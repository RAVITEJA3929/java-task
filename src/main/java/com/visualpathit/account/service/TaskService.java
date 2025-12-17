package com.visualpathit.account.service;

import com.visualpathit.account.model.Task;

import java.util.List;

public interface TaskService {
    List<Task> findAll();
    Task findById(Long id);
    Task save(Task task);
    void deleteById(Long id);
}
