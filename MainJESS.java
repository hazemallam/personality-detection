
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import jess.JessException;
import jess.Rete;


public class MainJESS extends JFrame {

    private JPanel contentPane;

    /**
     * Launch the application.
     * @param args
     */
    public static void main(String[] args) {
        
//        Rete r = new Rete();
//                try {
//                    //Value v = r.executeCommand("(printout t \"a\" crlf)");
//                    //System.out.println(r.getGlobalContext());
//                    r.batch("project.clp");
//                } catch (JessException ex) {
//                }
        
        EventQueue.invokeLater(new Runnable() {
            @Override
            public void run() {
                try {
                    UserFrame user=new UserFrame();
                    user.setVisible(true);
                    user.setLocation(20, 20);
                } catch (Exception e) {
                }
            }
        });
    }}

    /**
     * Create the frame.
     */
//    public MainJESS() {
//        setBackground(Color.WHITE);
//        setFont(new Font("Rockwell Condensed", Font.BOLD, 22));
//        setResizable(false);
//        setTitle("Car Assistant");
//        setLocationRelativeTo(null);
//        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//        setBounds(100, 100, 403, 297);
//        contentPane = new JPanel();
//        contentPane.setBackground(Color.WHITE);
//        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
//        setContentPane(contentPane);
//        contentPane.setLayout(null);
//
//        JButton btnOpenTheProject = new JButton("Start Asking Our Expert System");
//        btnOpenTheProject.addActionListener(new ActionListener() {
//            public void actionPerformed(ActionEvent e) {
//
//                new Thread(new Runnable() {
//
//                    @Override
//                    public void run() {
//                        // TODO Auto-generated method stub
//                        Rete r = new Rete();
//                        try {
//                            //Value v = r.executeCommand("(printout t \"a\" crlf)");
//                            //System.out.println(r.getGlobalContext());
//                            r.batch("cars.clp");
//                        } catch (JessException ex) {
//                            // TODO Auto-generated catch block
//                            ex.printStackTrace();
//                        }
//                    }
//                }).start();
//
//            }
//        });
//        btnOpenTheProject.setFont(new Font("Rockwell Condensed", Font.BOLD, 22));
//        btnOpenTheProject.setBounds(10, 139, 367, 50);
//        contentPane.add(btnOpenTheProject);
//
//        JButton btnAbout = new JButton("About");
//        btnAbout.addActionListener(new ActionListener() {
//            public void actionPerformed(ActionEvent arg0) {
//                String msg = "JESS Project by:\n1-Eslam Hamouda\n2-Bahaa Alaa\n3-Hossam Nabeeh\n4-Ahmed Wahdan\n4-Mohamed Shaalan\n\nThank You Dr\\Heba & Eng\\Amira!!!";
//                JOptionPane.showMessageDialog(null, msg, "About the project", JOptionPane.INFORMATION_MESSAGE);
//            }
//        });
//        btnAbout.setFont(new Font("Tahoma", Font.BOLD, 11));
//        btnAbout.setBounds(153, 234, 89, 23);
//        contentPane.add(btnAbout);
//
//        JLabel lblNewLabel = new JLabel("");
//        lblNewLabel.setIcon(new ImageIcon("D:\\Projects\\Android\\JESS_Project\\Auto-Angry-icon.png"));
//        lblNewLabel.setBounds(120, 0, 128, 128);
//        contentPane.add(lblNewLabel);
//    }
//}
