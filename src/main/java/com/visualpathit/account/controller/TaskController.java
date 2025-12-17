package com.visualpathit.account.controller;

import com.visualpathit.account.model.Task;
import com.visualpathit.account.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/tasks")
public class TaskController {

    private final TaskService service;

    public TaskController(TaskService service) {
        this.service = service;
    }

    @GetMapping
    public String listTasks(Model model) {
        model.addAttribute("tasks", service.findAll());
        model.addAttribute("task", new Task());
        return "taskboard";
    }

    @PostMapping
    public String createTask(@ModelAttribute("task") @Valid Task task,
                             BindingResult result,
                             Model model) {
        if (result.hasErrors()) {
            model.addAttribute("tasks", service.findAll());
            return "taskboard";
        }
        service.save(task);
        return "redirect:/tasks";
    }

    @GetMapping("/{id}/delete")
    public String deleteTask(@PathVariable Long id) {
        service.deleteById(id);
        return "redirect:/tasks";
    }

    @GetMapping("/{id}/status")
    public String updateStatus(@PathVariable Long id,
                               @RequestParam String status) {
        Task t = service.findById(id);
        if (t != null) {
            t.setStatus(status);
            service.save(t);
        }
        return "redirect:/tasks";
    }
}
