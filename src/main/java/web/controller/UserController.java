package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import web.model.Role;
import web.model.User;
import web.service.RoleService;
import web.service.UserService;
import java.util.HashSet;
import java.util.Set;

@Controller
@RequestMapping("/")
public class UserController {

	private UserService userService;
	private RoleService roleService;

	@Autowired
	public UserController(@Qualifier("userServiceImp") UserService userService, RoleService roleService) {
		this.userService = userService;
		this.roleService = roleService;
	}

	@GetMapping("/admin")
	public String getAllUsers(ModelMap model) {
		model.addAttribute("userList", userService.getAllUser());
		model.addAttribute("roleList", roleService.getAllRole());
		return "readUser";
	}

	@GetMapping("/user")
	public String infoUserPage() {
		return "infoUser";
	}

	@GetMapping("/admin/updateUser")
	public String updateUserPage(ModelMap model, Long id) {
		model.addAttribute("user", userService.getUserById(id));
		model.addAttribute("roleList", roleService.getAllRole());
		return "updateUser";
	}

	@PostMapping("/admin/updateUser")
	public ModelAndView updateUser(ModelMap model, User user) {
		userService.updateUser(findUserRole(user));
		model.addAttribute("attribute", "redirectWithRedirectPrefix");
		return new ModelAndView("redirect:/admin", model);
	}

	@PostMapping("/admin/addUser")
	public ModelAndView addUser(ModelMap model, User user) {
		userService.addUser(findUserRole(user));
		model.addAttribute("attribute", "redirectWithRedirectPrefix");
		return new ModelAndView("redirect:/admin", model);
	}

	@GetMapping("/admin/deleteUser")
	public ModelAndView deleteUser(ModelMap model, Long id) {
		userService.deleteUser(id);
		model.addAttribute("attribute", "redirectWithRedirectPrefix");
		return new ModelAndView("redirect:/admin", model);
	}

	@GetMapping("/login")
    public String loginPage() {
        return "login";
    }

	@GetMapping("/logout")
	public String logoutPage() {
		return "logout";
	}

	private User findUserRole(User user) {
		Set<Role> userRoles = new HashSet<>();
		for (Role role: user.getRoles()) {
			userRoles.add(roleService.getRoleByName(role.getRole()));
		}
		user.setRoles(userRoles);
		return user;
	}
}