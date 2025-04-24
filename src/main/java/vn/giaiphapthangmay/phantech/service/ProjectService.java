package vn.giaiphapthangmay.phantech.service;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import vn.giaiphapthangmay.phantech.domain.Project;
import vn.giaiphapthangmay.phantech.repository.ProjectRepository;

@Service
public class ProjectService {

    private final UploadService uploadService;
    private final ProjectRepository projectRepository;

    public ProjectService(UploadService uploadService, ProjectRepository projectRepository) {
        this.uploadService = uploadService;
        this.projectRepository = projectRepository;
    }

    public Page<Project> getAllProjects(int page, int size) {
        Pageable pageable = PageRequest.of(page - 1, size, Sort.by("id").descending());
        return projectRepository.findAll(pageable);
    }

    public Map<String, Object> handleSaveUploadFile(MultipartFile file, String folder) throws IOException {
        Map<String, Object> response = new HashMap<>();
        String filePath = uploadService.handleSaveUploadFile(file, folder);
        response.put("filePath", filePath);
        return response;
    }

}